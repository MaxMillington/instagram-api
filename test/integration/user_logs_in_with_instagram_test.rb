require "test_helper"
class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Instagram::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link_or_button "Login with Instagram"
    assert_equal "/", current_path
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
                                                      provider: 'instagram',
                                                      extra: {
                                                          raw_info: {
                                                              user_id: "1234",
                                                              name: "Horace",
                                                              screen_name: "worace",
                                                                         }
                                                                     },
                                                      credentials: {
                                                          token: "pizza",
                                                          secret: "secretpizza"
                                                                     }
                                                                 })
  end

end