# frozen_string_literal: true

require_relative 'identity_verification'
require_relative 'reject_reason'
require_relative 'requestable_record'

module Jumio
  module Entities
    # Document authenticity details
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md#retrieving-verification-data-only
    class Verification < RequestableRecord
      attribute :identityVerification, IdentityVerification.meta(omittable: true)
      attribute :rejectReason,         RejectReason.meta(omittable: true)
      attribute :mrzCheck,             Types::Strict::String.meta(omittable: true)
    end
  end
end
