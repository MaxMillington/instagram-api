

require 'simplecov'
require 'vcr'
require 'webmock'

SimpleCov.start do
  add_filter 'config'
  add_filter 'application_controller'
end

VCR.configure do |c|
  c.hook_into                 :webmock
  c.cassette_library_dir      = 'spec/support/vcr_cassettes'
end

RSpec.configure do |config|
  require 'capybara/rspec'
  require 'database_cleaner'
  require 'simplecov'

  SimpleCov.start 'rails'

  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  WebMock.stub_request(:any, "www.localhost:3000")

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  def user
    @user ||= User.new(name: "Max Millington",
                       nickname: "lakelouiserd",
                       image_url: "",
                       bio: "Cool!",
                       website: "monkey.com",
                       token: ENV['instagram_test'],
                       uid: "1234",
                       provider: "instagram")
  end

  def login_user
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new ({
                                                                       'provider'    => user.provider,
                                                                       'uid'         => user.uid,
                                                                       'info'        => {:name =>user.name,
                                                                                         :nickname =>user.nickname,
                                                                                         :bio =>user.bio,
                                                                                         :website =>user.website,
                                                                                         :image =>user.image_url},
                                                                       'credentials' => {:token => ENV['instagram_test']}
                                                                   })
  end

end