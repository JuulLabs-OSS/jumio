require 'spec_helper'

RSpec.describe Jumio::Operations::GetScanDetails do
  describe 'call' do
    subject { Jumio.get_scan_details.call(scan_reference) }

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

    context 'with a successfully completed scan' do
      let(:scan_reference) { '1828c1ec-2f87-46ce-b3c9-cc47a1241bb0' }

      it 'returns the scan details' do
        VCR.use_cassette('get_scan_details/get_scan_details') do
          expect(subject).to be_a(Jumio::Entities::Scan)
          expect(subject.scanReference).to eq(scan_reference)
          expect(subject.document.status).to eq('APPROVED_VERIFIED')
          expect(subject.verification.identityVerification.similarity).to eq('MATCH')
        end
      end
    end

    context 'with a scan of a blurry document' do
      let(:scan_reference) { 'af5e6caa-b679-48b0-9509-1a14125a9cb8' }

      specify do
        VCR.use_cassette('get_scan_details/get_scan_details/get_blurry') do
          expect(subject.document.status).to eq('ERROR_NOT_READABLE_ID')
          expect(subject.verification.rejectReason.rejectReasonDescription).to eq('NOT_READABLE_DOCUMENT')
          expect(subject.verification.rejectReason.rejectReasonDetails.map(&:to_h)).
            to eq([{ detailsCode: '2001', detailsDescription: 'BLURRED' }])
        end
      end
    end

    context 'with a scan of a manipulated document' do
      let(:scan_reference) { 'fb0591b0-caa5-42d4-a37a-ad19411bc32f' }

      specify do
        VCR.use_cassette('get_scan_details/get_scan_details/get_manipulated') do
          expect(subject.document.status).to eq('DENIED_FRAUD')
          expect(subject.verification.rejectReason.rejectReasonDescription).to eq('MANIPULATED_DOCUMENT')
          expect(subject.verification.rejectReason.rejectReasonDetails.map(&:to_h)).
            to eq([
                    { detailsCode: '1007', detailsDescription: 'SECURITY_CHECKS' },
                    { detailsCode: '1004', detailsDescription: 'DOB' }
                  ])
        end
      end
    end

    context 'with a scan that has been updated' do
      let(:scan_reference) { '63c69f89-ccae-4108-bc32-4b621bccb5b9' }

      it 'returns the scan details' do
        VCR.use_cassette('get_scan_details/get_scan_details/get_updated') do
          expect(subject).to be_a(Jumio::Entities::Scan)
          expect(subject.scanReference).to eq(scan_reference)
          expect(subject.document.status).to eq('DENIED_FRAUD')
          expect(subject.verification.identityVerification.similarity).to eq('MATCH')
          expect(subject.transaction.updatedAt).to be_a(DateTime)
        end
      end
    end
  end
end
