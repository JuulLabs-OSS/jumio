# frozen_string_literal: true

require 'active_support/core_ext/string'
require 'jumio/container'

module Jumio
  module Operations
    # Fetch only the upload status of a Netverify transaction
    class GetScanStatus
      include JDC_CONTAINER[scan_repository: 'repositories.scan']

      # @param scan_reference [String] Jumio’s reference number of an existing scan from your account
      # @return [Entities::ScanStatus]
      def call(scan_reference, client = nil)
        raise ArgumentError, 'Scan reference required' unless scan_reference.present?
        scan_repository.get_status(scan_reference, client)
      end
    end
  end
end
