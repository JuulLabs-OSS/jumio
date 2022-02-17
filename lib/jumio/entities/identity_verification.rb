# frozen_string_literal: true

require_relative 'api_entity'

module Jumio
  module Entities
    # Comparison between customer photo and identification
    class IdentityVerification < ApiEntity
      attribute :handwrittenNoteMatches, Types::Strict::String.meta(omittable: true)
      attribute :reason,                 Types::Strict::String.meta(omittable: true)
      attribute :similarity,             Types::Strict::String.meta(omittable: true)
      attribute :validity,               Types::Strict::String.meta(omittable: true)
    end
  end
end
