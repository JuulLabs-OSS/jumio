# frozen_string_literal: true

require 'active_support/core_ext/array/wrap'

require_relative 'api_entity'
require_relative 'reject_reason_details'

module Jumio
  module Entities
    # Explanation for identity validation failure
    class RejectReason < ApiEntity
      attribute :rejectReasonCode,        Types::Strict::String.meta(omittable: true)
      attribute :rejectReasonDescription, Types::Strict::String.meta(omittable: true)

      # Since the API used to fetch scan details may return a hash or an array
      # we choose to wrap this attribute so that it is _always_ an array.
      attribute :rejectReasonDetails,     Types::Array(RejectReasonDetails).
        constructor { |val| Array.new(::Array.wrap(val)) }.
        meta(omittable: true)
    end
  end
end
