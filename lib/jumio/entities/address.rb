# frozen_string_literal: true

require_relative 'api_entity'

module Jumio
  module Entities
    # A generic address payload.
    # Jumio is very vague about what could come back, so this entity is currently
    # very permissive to accomodate all possible formats.
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md#us-address-format
    class Address < ApiEntity
      attribute :city,            Types::Strict::String.meta(omittable: true)
      attribute :country,         Types::Strict::String.meta(omittable: true)
      attribute :line1,           Types::Strict::String.meta(omittable: true)
      attribute :line2,           Types::Strict::String.meta(omittable: true)
      attribute :line3,           Types::Strict::String.meta(omittable: true)
      attribute :line4,           Types::Strict::String.meta(omittable: true)
      attribute :line5,           Types::Strict::String.meta(omittable: true)
      attribute :stateCode,       Types::Strict::String.meta(omittable: true)
      attribute :streetDirection, Types::Strict::String.meta(omittable: true)
      attribute :streetName,      Types::Strict::String.meta(omittable: true)
      attribute :streetNumber,    Types::Strict::String.meta(omittable: true)
      attribute :streetSuffix,    Types::Strict::String.meta(omittable: true)
      attribute :unitDesignator,  Types::Strict::String.meta(omittable: true)
      attribute :unitDetails,     Types::Strict::String.meta(omittable: true)
      attribute :unitNumber,      Types::Strict::String.meta(omittable: true)
      attribute :zip,             Types::Strict::String.meta(omittable: true)
      attribute :zipExtension,    Types::Strict::String.meta(omittable: true)
    end
  end
end
