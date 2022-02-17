# frozen_string_literal: true

require_relative 'api_entity'

module Jumio
  module Entities
    # Explanation for identity validation failure
    class RejectReasonDetails < ApiEntity
      attribute :detailsCode,        Types::Strict::String.meta(omittable: true)
      attribute :detailsDescription, Types::Strict::String.meta(omittable: true)
    end
  end
end
