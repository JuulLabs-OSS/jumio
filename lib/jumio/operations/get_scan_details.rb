# frozen_string_literal: true

require 'active_support/core_ext/string'
require 'jumio/container'

module Jumio
  module Operations
    # Fetch all available information for a Netverify transaction
    class GetScanDetails
      include JDC_CONTAINER[scan_repository: 'repositories.scan']

      # @param scan_reference [String] Jumio’s reference number of an existing scan from your account
      # @param client [Jumio::HttpClient, nil] The HTTP client to use
      # @return [Entities::Scan]
      def call(scan_reference, client = nil)
        raise ArgumentError, 'Scan reference required' unless scan_reference.present?
        scan_repository.get_details(scan_reference, client)
      end
    end
  end
end
