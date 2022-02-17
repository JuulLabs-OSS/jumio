if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'dotenv/load'
require 'active_support'
require 'bundler/setup'
require 'jumio'
require 'pry'

Jumio.configure do |config|
  config.api.secret = ENV['JUMIO_API_SECRET']
  config.api.token = ENV['JUMIO_API_TOKEN']

  config.merchant.app_name = 'App'
  config.merchant.company_name = 'Company'
  config.merchant.version = Jumio::VERSION
end

require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
