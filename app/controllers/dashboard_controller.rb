class DashboardController < ApplicationController
  def index
  end

  def show
      @id = params[:id]
      @profile_client = Instagram.client(access_token: current_user.token)
  end

  def new

  end

  def search
    tags = profile_client
    if tags[0].nil?
      @posts = profile_client.user_recent_media
    else
      @posts = profile_client.tag_recent_media(tag[0].name)
    end
  end

end