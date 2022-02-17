# frozen_string_literal: true

require_relative 'document'
require_relative 'requestable_record'
require_relative 'transaction'
require_relative 'verification'

module Jumio
  module Entities
    # A scan details api response
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md#retrieving-scan-details
    #
    # This entity will contain only a transaction (with some status information)
    # until Jumio has completed their verification process.
    class Scan < RequestableRecord
      attribute :document,      Document.meta(omittable: true)
      attribute :transaction,   Transaction
      attribute :verification,  Verification.meta(omittable: true)

      # Added for parity with the ScanStatus response entity
      def status
        transaction.status
      end
    end
  end
end
