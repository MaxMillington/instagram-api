class ProfileController < ApplicationController

  def show
    @posts = current_user.client.user_recent_media
  end

end
