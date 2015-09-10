require 'rails_helper'
describe "instagram services" do

  before do
    @test_user = User.create(nickname: "mitchashby")
    @service = Instagram.client
    allow_any_instance_of(Instagram::Client).to receive(:user).and_return(@test_user)
  end

  it 'grabs instagram data' do
    expect(@service.class).to eq(Instagram::Client)
    expect(@service.user.nickname).to eq("mitchashby")
  end

end