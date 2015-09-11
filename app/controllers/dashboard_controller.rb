class DashboardController < ApplicationController

  def index
  end

  # def show
  #   @id = params[:id]
  #   @profile_client = Instagram.client(access_token: current_user.token)
  # end

  def popular
    @posts = current_user.client.media_popular
  end


  def search
    tags = current_client.tag_search(params[:search])
    if tags[0].nil?
      redirect_to profile_path
    else
      @posts = current_client.tag_recent_media(tags[0].name)
    end
  end

end