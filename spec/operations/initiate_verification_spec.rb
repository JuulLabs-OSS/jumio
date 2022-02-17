require 'spec_helper'

RSpec.describe Jumio::Operations::InitiateVerification do
  let(:m) { Dry::Monads }

  describe 'call' do
    subject { described_class.new.call(params) }

    context 'with valid params' do
      let(:params) {
        {
          customerInternalReference: 'customerInternalReference',
          userReference: 'userReference'
        }
      }

      it 'returns a new scan reference' do
        VCR.use_cassette('initiate_verification/valid_params') do
          expect(subject).to be_a(Jumio::Entities::VerificationResponse)
          expect(subject.to_h).to match(
            timestamp: be_a(String),
            redirectUrl: be_a(String),
            transactionReference: be_a(String)
          )
        end
      end
    end

    context 'with invalid params' do
      let(:params) { {} }

      it 'returns a new scan reference' do
        expect(subject).to eq(m.Failure(
          customerInternalReference: ['is missing'],
          userReference: ['is missing']
        ))
      end
    end
  end
end
