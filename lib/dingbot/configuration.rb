module DingBot
  # Defines constants and methods related to configuration.
  module Configuration
    # An array of valid keys in the options hash when configuring a Sentry::API.
    VALID_OPTIONS_KEYS = [:endpoint, :access_token, :httparty].freeze

    # The user agent that will be sent to the API endpoint if none is set.
    DEFAULT_USER_AGENT = "DingBot Ruby Gem #{DingBot::VERSION}".freeze

    DEFAULT_ENDPOINT = "https://oapi.dingtalk.com/robot/send"

    # @private
    attr_accessor(*VALID_OPTIONS_KEYS)

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield self
    end

    # Creates a hash of options and their values.
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset
      self.endpoint = ENV['DINGTALK_ENDPOINT'] || DEFAULT_ENDPOINT
      self.access_token = ENV['DINGTALK_ACCESS_TOKEN']
    end

  end
end
