# frozen_string_literal: true

require 'dry-schema'

module Jumio
  module Schemas
    # Request payload for initiating a new Netverify scan.
    # These options customize the upload flow on a per-request basis.
    # Default values for many of these options can be set in the Customer Portal.
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-web-v4.md#request-body
    VerificationRequest = Dry::Schema.define do
      # Your internal reference for the transaction.
      required(:customerInternalReference).filled(:str?)
      # Your internal reference for the user.
      required(:userReference).filled(:str?)

      # Sends verification result to this URL upon completion.
      optional(:callbackUrl).filled(:str?)
      # Redirects to this URL after an unsuccessful transaction.
      optional(:errorUrl).filled(:str?)
      # Renders content in the specified language.
      optional(:locale).filled(:str?)
      # Preset the country and document type to bypass the selection screen.
      optional(:presets).schema do
        required(:index).value(eql?: 1)
        # Possible values: ISO 3166-1 alpha-3 country code
        required(:country).filled(:str?).value(size?: 3)
        required(:type).value(included_in?: ['PASSPORT', 'DRIVING_LICENSE', 'ID_CARD'])
      end
      # Your reporting criteria for the transaction.
      optional(:reportingCriteria).filled(:str?)
      # Redirects to this URL after a successful transaction.
      optional(:successUrl).filled(:str?)
      # Applies this acquisition workflow to the transaction.
      optional(:workflowId).filled(:int?)
    end
  end
end
