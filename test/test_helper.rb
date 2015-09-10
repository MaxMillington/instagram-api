require 'simplecov'
SimpleCov.start do
  add_filter 'config'

end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'
require "instagram"
Instagram.configure do |config|
  config.client_id = ENV['instagram_id']
  config.client_secret = ENV['instagram_secret_key']
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


