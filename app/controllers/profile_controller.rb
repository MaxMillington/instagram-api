class ProfileController < ApplicationController

  def show
    @profile = current_user.client.user_recent_media.paginate(page: params[:page], per_page: 18)
  end

end
