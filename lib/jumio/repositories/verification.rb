# frozen_string_literal: true

require 'jumio/entities'

module Jumio
  module Repositories
    class Verification
      # A wrapper for the Netverify web client api
      #
      # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-web-v4.md
      include JDC_CONTAINER[default_client: 'http_client']

      # @param verification_params [Hash] Request payload for initiating a new Netverify scan.
      # @param client [Jumio::HttpClient, nil] The HTTP client to use
      # @return [Entities::VerificationResponse]
      def initiate(verification_params, client = nil)
        raw_verification = (client || default_client.new).post('v4/initiate', verification_params)
        Entities::VerificationResponse.new(raw_verification)
      end
    end
  end
end
