require 'spec_helper'

RSpec.describe Jumio::Operations::GetScanStatus do
  describe 'call' do
    subject { Jumio.get_scan_status.call(scan_reference) }

    context 'with no scan reference' do
      let(:scan_reference) { nil }

      it 'returns the scan status' do
        expect { subject }.to raise_error ArgumentError, 'Scan reference required'
      end
    end

    context 'with blank scan reference' do
      let(:scan_reference) { '' }

      it 'returns the scan status' do
        expect { subject }.to raise_error ArgumentError, 'Scan reference required'
      end
    end

    context 'with missing scan' do
      let(:scan_reference) { 'e45734be-effb-45e7-848c-5b3ce42662e5' }

      it 'returns the scan status' do
        VCR.use_cassette('get_scan_status/missing_scan') do
          expect { subject }.to raise_error Jumio::RecordNotFound, 'Not found: Scan not found for e45734be-effb-45e7-848c-5b3ce42662e5'
        end
      end
    end

    context 'with a scan pending upload' do
      let(:new_scan) {
        VCR.use_cassette('get_scan_status/initiate_scan') do
          Jumio.initiate_verification.call(
            customerInternalReference: 'customerInternalReference',
            userReference: 'userReference'
          )
        end
      }
      let(:scan_reference) {
        new_scan.transactionReference
      }

      it 'returns the scan status' do
        VCR.use_cassette('get_scan_status/get_scan_status') do
          expect(subject).to be_a(Jumio::Entities::ScanStatus)
          expect(subject.to_h).to match(
            scanReference: scan_reference,
            status: 'PENDING',
            timestamp: be_a(String)
          )
        end
      end
    end
  end
end
