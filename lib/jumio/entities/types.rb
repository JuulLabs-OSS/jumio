# frozen_string_literal: true

require 'dry-types'

module Jumio
  module Entities
    # A base entity including all of the default dry-types
    module Types
      include Dry.Types(default: :nominal)
    end
  end
end
