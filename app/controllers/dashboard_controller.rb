class DashboardController < ApplicationController
  def index
  end

  def show
      @id = params[:id]
      @profile_client = Instagram.client(access_token: current_user.token)
  end

  def new

  end

end