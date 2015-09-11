require "rails_helper"

RSpec.describe "User can see feed", type: :feature do
  context "A user with an instagram account" do

    it "renders feed and trending profile" do
      VCR.use_cassette("user_sees_feed_test#feed") do
        visit root_path
        login_user

        click_link "Login"

        expect(current_path).to eq(dashboard_feed_path)

        expect(page).to have_content "majestic_earth"
        expect(page).to have_content "#pustertal"
        expect(page).to have_content "FEATURE OF THE DAY"

        click_link "My Profile"

        expect(current_path).to eq(profile_path)
        expect(page).to have_content "lakelouiserd"

        click_link "Trending Posts"
        expect(current_path).to eq(dashboard_popular_path)

      end
    end


  end
end