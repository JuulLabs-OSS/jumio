# Jumio

[![Specs](https://github.com/JuulLabs-OSS/jumio/actions/workflows/specs.yml/badge.svg)](https://github.com/JuulLabs-OSS/jumio/actions/workflows/specs.yml)

This is a client to communicate with the [Jumio Netverify Web API](https://github.com/Jumio/implementation-guides/tree/master/netverify) to perform age verification.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jumio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jumio

## Usage

First, you need to configure them gem:

```ruby
Jumio.configure do |config|
  config.api.secret = 'your_api_secret'
  config.api.token = 'your_api_token'

  config.merchant.app_name = 'your app name'
  config.merchant.company_name = 'your company name'
  config.merchant.version = Jumio::VERSION
end
```

### Initiate a Verification

```ruby
Jumio.initiate_verification.call(
  customerInternalReference: 'your_customer_internal_reference',
  userReference: 'your_user_reference'
)
```

### Get Scan Status

```ruby
Jumio.get_scan_status.call('your_scan_reference')
```

### Get Scan Details

```ruby
Jumio.get_scan_details.call('your_scan_reference')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To execute tests, run `bundle exec rake spec`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuulLabs-OSS/jumio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Test project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JuulLabs-OSS/jumio/blob/master/CODE_OF_CONDUCT.md).
