require "rails_helper"

RSpec.describe "User can search stuff", type: :feature do
  context "A user with an instagram account" do

    it "shows search stuff" do
      VCR.use_cassette("user_searches test#search") do
        visit root_path
        login_user

        click_link "Login"

        expect(current_path).to eq(dashboard_feed_path)

        fill_in "search", with: ("monkey")
        click_link_or_button("search-tags")
        expect(current_path).to eq(search_path)

        fill_in "search", with: ("")
        click_link_or_button("search-tags")
        expect(current_path).to eq(profile_path)
      end
    end


  end
end