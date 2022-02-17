# frozen_string_literal: true

module Jumio
  # configures an http client based on passed in credentials, or
  # uses the Jumio.api configuration. The instance will expose the
  # methods below that return lambdas. This is to maintain pairity
  # with the existing module interface
  class Client
    attr_reader :client

    # @param token [String, nil]
    # @param secret [String, nil]
    # @param base_url [String, nil]
    def initialize(token: nil, secret: nil, base_url: nil)
      @client = Container.resolve('http_client').new(
        token: token,
        secret: secret,
        base_url: base_url
      )
    end

    def get_scan_details
      ->(scan_reference) {
        Container.resolve('get_scan_details').
          call(scan_reference, client)
      }
    end

    def get_scan_status
      ->(scan_reference) {
        Container.resolve('get_scan_status').
          call(scan_reference, client)
      }
    end

    def initiate_verification
      ->(verification_params) {
        Container.resolve('initiate_verification').
          call(verification_params, client)
      }
    end
  end
end
