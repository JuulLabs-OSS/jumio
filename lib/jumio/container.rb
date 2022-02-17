# frozen_string_literal: true

require 'dry-auto_inject'

module Jumio
  # Publicly accessible parts of Jumio gem
  class Container
    extend Dry::Container::Mixin

    register(:http_client) { Object.const_get('Jumio::HttpClient') }

    register(:get_scan_details) { Object.const_get('Jumio::Operations::GetScanDetails').new }
    register(:get_scan_status) { Object.const_get('Jumio::Operations::GetScanStatus').new }
    register(:initiate_verification) { Object.const_get('Jumio::Operations::InitiateVerification').new }

    namespace(:repositories) do
      register(:scan) { Object.const_get('Jumio::Repositories::Scan').new }
      register(:verification) { Object.const_get('Jumio::Repositories::Verification').new }
    end
  end

  JDC_CONTAINER = Dry::AutoInject(Container)
end
