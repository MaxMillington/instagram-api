class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
end
