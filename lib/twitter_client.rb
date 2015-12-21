require 'singleton'

##
# Singleton class for the twitter client
#

class TwitterClient
  include Singleton

  def initialize
    @client = Twitter::REST::Client.new do |config|
      puts "initializing new singleton client..."
      config.consumer_key        = Rails.application.secrets.consumer_key
      config.consumer_secret     = Rails.application.secrets.consumer_secret
      config.access_token        = Rails.application.secrets.access_token
      config.access_token_secret = Rails.application.secrets.access_secret
    end
  end

  def get
    @client
  end

end