class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_client


  def current_client
    if session[:user_id]
      user = User.find(session[:user_id])
      @current_client ||= Instagram.client(:access_token => user.token)
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def profile_client
    Instagram.client(access_token: current_user.token)
  end

  def authorize!
    redirect_to root_path unless current_user
  end

  def check_for_nil_users(users)
    if users[0].nil?
      redirect_to profile_path
    else
      @users = users
    end
  end

  def check_for_nil_tags(tags)
    if tags[0].nil?
      redirect_to profile_path
    else
      @posts = current_client.tag_recent_media(tags[0].name)
    end
  end
end
