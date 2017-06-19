require "dingbot/version"
require 'dingbot/error'
require 'dingbot/client'
require 'dingbot/configuration'
require 'dingbot/message/text'
require 'dingbot/message/link'
require 'dingbot/message/markdown'
require 'dingbot/message/action_card'
require 'dingbot/message/feed_card'

module DingBot
  extend Configuration

  # Alias for DingBot::Client.new
  #
  # @return [DingBot::Client]
  def self.client(options={})
    DingBot::Client.new(options)
  end

  # Delegate to DingBot::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to DingBot::Client
  def respond_to_missing?(method_name, include_private = false)
    client.respond_to?(method_name) || super
  end

  # Delegate to HTTParty.http_proxy
  def self.http_proxy(address=nil, port=nil, username=nil, password=nil)
    DingBot::Client.http_proxy(address, port, username, password)
  end

  # Returns an unsorted array of available client methods.
  #
  # @return [Array<Symbol>]
  def self.actions
    hidden = /access_token|post|validate|httparty/
    (DingBot::Client.instance_methods - Object.methods).reject {|e| e[hidden]}
  end

end
