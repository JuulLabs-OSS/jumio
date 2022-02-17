require 'spec_helper'

RSpec.describe Jumio::Entities::Scan do
  describe 'status' do
    let(:scan) {
      described_class.new(
        transaction: {
          date: '2018-10-29T15:56:54.398Z',
          source: 'WEB_UPLOAD',
          status: 'DONE'
        }
      )
    }

    subject { scan.status }

    it 'is the transaction status' do
      is_expected.to eq('DONE')
    end
  end
end
