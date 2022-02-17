require 'spec_helper'
require 'jumio/client'

RSpec.describe Jumio::Client do
  Jumio.configure do |config|
    config.api.token = 'config_token'
    config.api.secret = 'config_secret'
  end

  let(:config) { { token: nil, secret: nil, base_url: nil } }
  let(:instance) { described_class.new(**config) }

  describe '#new' do
    subject { instance }

    it 'creates a Jumio Client' do
      expect(subject.client).to be_a Jumio::HttpClient
      expect(subject.client.instance_variable_get('@api_token')).to eq 'config_token'
      expect(subject.client.instance_variable_get('@api_secret')).to eq 'config_secret'
    end

    context 'with a config' do
      let(:config) { { token: 'test', secret: 'super', base_url: 'https://test.com/api/' } }
      let(:scan_reference) { '1828c1ec-2f87-46ce-b3c9-cc47a1241bb0' }

      it 'creates a jumio client' do
        expect(subject.client).to be_a Jumio::HttpClient
        expect(subject.client.instance_variable_get('@api_token')).to eq 'test'
        expect(subject.client.instance_variable_get('@api_secret')).to eq 'super'
      end

      it 'can make a request with configured credentials' do
        VCR.use_cassette('client_configured/get_scan_details') do
          expect(instance.get_scan_details.call(scan_reference)).to be_a(Jumio::Entities::Scan)
        end
      end
    end
  end

  describe '#get_scan_details' do
    let(:scan_reference) { '1828c1ec-2f87-46ce-b3c9-cc47a1241bb0' }
    subject { instance.get_scan_details.call(scan_reference) }

    it 'returns the scan details' do
      VCR.use_cassette('get_scan_details/get_scan_details') do
        expect(subject).to be_a(Jumio::Entities::Scan)
      end
    end

    context 'with an invalid JSON response' do
      let(:body) do
        '<html><head><title>403 Forbidden</title></head><body><h1>Forbidden</h1></body></html>'
      end

      before do
        stub_request(
          :get,
          %r{https://netverify.com/api/netverify/v2/scans/.*/data}
        ).to_return(body: body, status: 200)
      end

      it 'returns an HTTP error' do
        expect { subject }.to raise_error(Net::HTTPError)
      end
    end
  end

  describe '#get_scan_status' do
    let(:new_scan) do
      VCR.use_cassette('get_scan_status/initiate_scan') do
        Jumio.initiate_verification.call(
          customerInternalReference: 'customerInternalReference',
          userReference: 'userReference'
        )
      end
    end
    let(:scan_reference) { new_scan.transactionReference }
    subject { instance.get_scan_status.call(scan_reference) }

    it 'returns the scan status' do
      VCR.use_cassette('get_scan_status/get_scan_status') do
        expect(subject).to be_a(Jumio::Entities::ScanStatus)
      end
    end
  end

  describe '#initiate_verification' do
    let(:verification_params) do
      {
        customerInternalReference: 'customerInternalReference',
        userReference: 'userReference'
      }
    end
    subject { instance.initiate_verification.call(verification_params) }

    it 'returns the scan details' do
      VCR.use_cassette('initiate_verification/valid_params') do
        expect(subject).to be_a(Jumio::Entities::VerificationResponse)
      end
    end
  end
end
