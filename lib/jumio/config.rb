# frozen_string_literal: true

require 'dry-configurable'

module Jumio
  extend Dry::Configurable

  setting :api, reader: true do
    setting :base_url, 'https://netverify.com/api/'
    setting :secret
    setting :token
  end

  setting :merchant, reader: true do
    setting :app_name, 'YourApp'
    setting :company_name, 'YourCompany'
    setting :version, '1.0'
  end
end
