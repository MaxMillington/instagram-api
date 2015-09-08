Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end