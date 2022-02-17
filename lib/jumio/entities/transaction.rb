# frozen_string_literal: true

require_relative 'requestable_record'

module Jumio
  module Entities
    # Inforation relating the upload up documents to be processed.
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md#retrieving-transaction-data-only
    class Transaction < RequestableRecord
      attribute :clientIp,                  Types::Strict::String.meta(omittable: true)
      attribute :customerId,                Types::Strict::String.meta(omittable: true)
      attribute :date,                      Types::Strict::String
      attribute :merchantReportingCriteria, Types::Strict::String.meta(omittable: true)
      attribute :merchantScanReference,     Types::Strict::String.meta(omittable: true)
      attribute :source,                    Types::Strict::String
      attribute :status,                    Types::Strict::String
      attribute :updatedAt,                 Types::JSON::DateTime.meta(omittable: true)
    end
  end
end
