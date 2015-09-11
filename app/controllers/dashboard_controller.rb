class DashboardController < ApplicationController

  def index
  end

  def popular
    @posts = current_user.client.media_popular
  end


  def search
    if params[:search] == ''
      redirect_to profile_path
    elsif
    tags = current_client.tag_search(params[:search])
      if tags[0].nil?
        redirect_to profile_path
      else
        @posts = current_client.tag_recent_media(tags[0].name)
      end
    end
  end

  def user_search
    if params[:search] == ''
      redirect_to profile_path
    elsif
    users = current_client.user_search(params[:search])
      if users[0].nil?
        redirect_to profile_path
      else
        @users = users
      end
    end
  end

end