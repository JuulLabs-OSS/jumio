# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

module Jumio
  class RecordNotFound < StandardError; end

  # Makes HTTPS requests to Jumio JSON apis
  class HttpClient
    # @param token [String, nil]
    # @param secret [String, nil]
    # @param base_url [String, nil]
    def initialize(token: nil, secret: nil, base_url: nil)
      @api_token = (token || Jumio.api.token)
      @api_secret = (secret || Jumio.api.secret)
      @api_base_url = (base_url || Jumio.api.base_url)
    end

    # @param url [String]
    # @raise [RecordNotFound] On 404 response
    # @raise [Net::HTTPError] On JSON response parsing error
    # @return [Hash] The response
    def get(url)
      uri = URI.join(@api_base_url, url)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        req = Net::HTTP::Get.new(uri)
        req.basic_auth(@api_token, @api_secret)
        req['Accept'] = 'application/json'
        req['Content-Type'] = 'application/json'
        req['User-Agent'] = user_agent
        http.request(req)
      end
      handle_response(response)
    end

    # @param url [String]
    # @param body [String]
    # @raise [RecordNotFound] On 404 response
    # @raise [Net::HTTPError] On JSON response parsing error
    # @return [Hash] The response
    def post(url, body)
      uri = URI.join(@api_base_url, url)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        req = Net::HTTP::Post.new(uri)
        req.basic_auth(@api_token, @api_secret)
        req['Accept'] = 'application/json'
        req['Content-Type'] = 'application/json'
        req['User-Agent'] = user_agent
        req.body = body.to_json
        http.request(req)
      end
      handle_response(response)
    end

    private

    def handle_response(response)
      JSON.parse(response.body).tap do |body|
        response.error! if body['error']
        raise RecordNotFound, body['message'] if body['httpStatus'] == '404'
      end
    rescue JSON::ParserError => error
      raise Net::HTTPError.new("JSON::ParserError: #{error.message}", response)
    end

    def user_agent
      "#{Jumio.merchant.company_name} #{Jumio.merchant.app_name}/v#{Jumio.merchant.version}"
    end
  end
end
