




require "instagram"
Instagram.configure do |config|
  config.client_id = ENV['instagram_id']
  config.client_secret = ENV['instagram_secret_key']
end


RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end
