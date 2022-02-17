# frozen_string_literal: true

require_relative 'api_entity'

module Jumio
  module Entities
    # Successful initiation of a new Netverify Scan
    #
    # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-web-v4.md#response
    class VerificationResponse < ApiEntity
      attribute :timestamp,            Types::Strict::String # Timestamp (UTC) of the response. Format: YYYY-MM-DDThh:mm:ss.SSSZ
      attribute :redirectUrl,          Types::Strict::String # URL used to load the Netverify client.
      attribute :transactionReference, Types::Strict::String # Jumio reference number for the transaction.
    end
  end
end
