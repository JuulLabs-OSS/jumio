# frozen_string_literal: true

require 'jumio/entities'

module Jumio
  module Repositories
    # A wrapper for the Netverify scan retreival API
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md
    class Scan
      include JDC_CONTAINER[default_client: 'http_client']

      # @param scan_reference [String] Jumio’s reference number of an existing scan from your account
      # @param client [Jumio::HttpClient, nil] The HTTP client to use
      # @return [Entities::ScanStatus]
      def get_status(scan_reference, client = nil)
        raw_scan_status = (client || default_client.new).get("netverify/v2/scans/#{scan_reference}")
        Entities::ScanStatus.new(raw_scan_status)
      end

      # @param scan_reference [String] Jumio’s reference number of an existing scan from your account
      # @param client [Jumio::HttpClient, nil] The HTTP client to use
      # @return [Entities::Scan]
      def get_details(scan_reference, client = nil)
        raw_scan = (client || default_client.new).get("netverify/v2/scans/#{scan_reference}/data")
        Entities::Scan.new(raw_scan)
      end
    end
  end
end
