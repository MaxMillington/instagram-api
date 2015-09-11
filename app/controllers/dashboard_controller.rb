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
     check_for_nil_tags(tags)
    end
  end

  def user_search
    if params[:search] == ''
      redirect_to profile_path
    elsif
    users = current_client.user_search(params[:search])
     check_for_nil_users(users)
    end
  end
end