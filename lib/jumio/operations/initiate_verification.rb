# frozen_string_literal: true

require 'dry/monads/result'
require 'jumio/container'
require 'jumio/schemas'

module Jumio
  module Operations
    # Request a new Netverify session
    class InitiateVerification
      include Dry::Monads::Result::Mixin
      include JDC_CONTAINER[verification_repository: 'repositories.verification']

      # @param verification_params [Hash] Request payload for initiating a new Netverify scan.
      # @param client [Jumio::HttpClient, nil] The HTTP client to use
      # @return [Failure, Entities::VerificationResponse]
      def call(verification_params, client = nil)
        validation = Schemas::VerificationRequest.call(verification_params)
        return Failure.new(validation.message_set.to_h) unless validation.success?
        verification_repository.initiate(verification_params, client)
      end
    end
  end
end
