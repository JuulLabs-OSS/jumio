# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jumio/version"

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.6.0'
  spec.name          = "jumio"
  spec.version       = Jumio::VERSION
  spec.authors       = ['Juul Labs, Inc.']
  spec.email         = ['opensource@juul.com']

  spec.summary       = "Wrapper for Jumio Netverify Web API"
  spec.homepage      = "https://github.com/JuulLabs-OSS/jumio"
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'dry-auto_inject'
  spec.add_dependency 'dry-configurable'
  spec.add_dependency 'dry-container'
  spec.add_dependency 'dry-monads'
  spec.add_dependency "dry-schema", "~> 1.6.0"
  spec.add_dependency 'dry-struct', '~> 1.4.0'

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  # Until cc-test-reporter works with 0.18.0
  # https://github.com/codeclimate/test-reporter/issues/418
  spec.add_development_dependency "simplecov", "~> 0.17.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"
end
