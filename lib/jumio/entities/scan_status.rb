# frozen_string_literal: true

require_relative 'requestable_record'

module Jumio
  module Entities
    class ScanStatus < RequestableRecord
      # A separate entity to hold the "scan status request"
      #
      # https://github.com/Jumio/implementation-guides/blob/master/netverify/netverify-retrieval-api.md#retrieving-scan-status
      #
      # Since this endpoint returns _only_ a status value and the "scan details"
      # does not return this same status at all, we have a separate entity for
      # each, so as to not have one shared entity with all attributes optional.
      #
      # Although the Jumio docs describe this as "required", we have seen scans
      # come back without one.
      attribute :status, Types::Strict::String.meta(omittable: true) # Possible states: PENDING, DONE, FAILED
    end
  end
end
