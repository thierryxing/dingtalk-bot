require 'httparty'
require 'json'
require 'dingbot/configuration'
require 'dingbot/message/base'
require 'dingbot/message/text'
require 'dingbot/message/markdown'

module DingBot
  # @private
  class Client
    include HTTParty

    format :json
    headers "Content-Type" => "application/json"

    # attr_accessor :access_token
    # attr_accessor :secret

    # @private
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    # Creates a new API.
    # @raise [Error:MissingCredentials]
    def initialize(options={})
      options = DingBot.options.merge(options)
      (Configuration::VALID_OPTIONS_KEYS).each do |key|
        send("#{key}=", options[key]) if options[key]
      end
    end

    # Parse response body.
    def self.parse(body)
      begin
        decode(body)
      rescue => e
        raise Error::Parsing.new "Couldn't parse a response body"
      end
    end

    # Decodes a JSON response into Ruby object.
    def self.decode(response)
      JSON.load response
    rescue JSON::ParserError
      raise Error::Parsing.new "The response is not a valid JSON"
    end

    def send_msg(message)
      query = {
        access_token: @access_token,
      }

      if !@secret.nil? and !@secret.empty?
        timestamp = (Time.now.to_f * 1000).to_i

        query.merge!({
          timestamp: timestamp,
          sign: Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), @secret, "#{timestamp}\n#{@secret}")).strip
        })
      end

      validate self.class.post(@endpoint, { query: query, body: message.to_json })
    end

    def send_text(content)
      message = DingBot::Message::Text.new(content)
      send_msg(message)
    end

    def send_markdown(title, text)
      message = DingBot::Message::Markdown.new(title, text)
      send_msg(message)
    end

    # Checks the response code for common errors.
    # Returns parsed response for successful requests.
    def validate(response)
      error_klass = case response.code
                      when 400 then
                        Error::BadRequest
                      when 401 then
                        Error::Unauthorized
                      when 403 then
                        Error::Forbidden
                      when 404 then
                        Error::NotFound
                      when 405 then
                        Error::MethodNotAllowed
                      when 409 then
                        Error::Conflict
                      when 422 then
                        Error::Unprocessable
                      when 500 then
                        Error::InternalServerError
                      when 502 then
                        Error::BadGateway
                      when 503 then
                        Error::ServiceUnavailable
                    end

      fail error_klass.new(response) if error_klass
      parsed = response.parsed_response
      
      body = JSON.parse(response.body)
      errcode = body["errcode"]
      fail body["errmsg"] if errcode != 0

      parsed.client = self if parsed.respond_to?(:client=)
      parsed.parse_headers!(response.headers) if parsed.respond_to?(:parse_headers!)
      parsed
    end

  end
end
