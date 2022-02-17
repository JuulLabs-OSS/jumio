# frozen_string_literal: true

require 'dry-struct'
require_relative 'types'

module Jumio
  module Entities
    # Base netverify api entity
    class ApiEntity < Dry::Struct
      # Allows us to easily consume api payloads
      transform_keys(&:to_sym)
    end
  end
end
