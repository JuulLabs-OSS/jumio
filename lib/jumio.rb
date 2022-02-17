# frozen_string_literal: true

require 'jumio/client'
require 'jumio/http_client'
require 'jumio/config'
require 'jumio/container'
require 'jumio/entities'
require 'jumio/factories'
require 'jumio/operations'
require 'jumio/repositories'
require 'jumio/version'

module Jumio
  # Configuration free methods
  #
  # These use the default http_client configured with Jumio.api
  #
  # To use a per instance configuration client, use
  # Jumio::Client.new(:token, :secret)

  def self.get_scan_details
    Container.resolve('get_scan_details')
  end

  def self.get_scan_status
    Container.resolve('get_scan_status')
  end

  def self.initiate_verification
    Container.resolve('initiate_verification')
  end
end
