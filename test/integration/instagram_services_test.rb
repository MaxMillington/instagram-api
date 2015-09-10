require 'rails_helper'
describe "instagram services" do

  before do
    @test_user = User.create(email: "mitchashby16@gmail.com")
    @service = Instagram.client
    allow_any_instance_of(Instagram::Client).to receive(:user).and_return(@test_user)
  end

  it 'grabs instagram data' do
    expect(@service.class).to eq(Instagram::Client)
    expect(@service.user.email).to eq(email: "mitchashby16@gmail.com")
  end

end