# frozen_string_literal: true

require_relative 'api_entity'
require_relative 'types'

module Jumio
  module Entities
    # Base entity for any item that can be directly requested from a netverify api.
    # Root payloads always contain a timestamp and scan reference.
    # These attributes are not present when part of a nested response.
    class RequestableRecord < ApiEntity
      attribute :timestamp,     Types::Strict::String.meta(omittable: true)
      attribute :scanReference, Types::Strict::String.meta(omittable: true)
    end
  end
end
