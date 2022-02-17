# frozen_string_literal: true

require 'jumio/entities/requestable_record'

module Jumio
  module Entities
    # Photo ID like Driver's license or Passport
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md#response-9
    class Document < RequestableRecord
      attribute :address,        Address.meta(omittable: true)
      attribute :dob,            Types::JSON::Date.meta(omittable: true)
      attribute :expiry,         Types::Strict::String.meta(omittable: true)
      attribute :idSubtype,      Types::Strict::String.meta(omittable: true)
      attribute :issuingCountry, Types::Strict::String.meta(omittable: true)
      attribute :issuingDate,    Types::Strict::String.meta(omittable: true)
      attribute :firstName,      Types::Strict::String.meta(omittable: true)
      attribute :lastName,       Types::Strict::String.meta(omittable: true)
      attribute :number,         Types::Strict::String.meta(omittable: true)
      attribute :optionalData1,  Types::Strict::String.meta(omittable: true)
      attribute :optionalData2,  Types::Strict::String.meta(omittable: true)
      attribute :personalNumber, Types::Strict::String.meta(omittable: true)
      attribute :status,         Types::Strict::String
      attribute :type,           Types::Strict::String.meta(omittable: true)
      attribute :usState,        Types::Strict::String.meta(omittable: true)
    end
  end
end
