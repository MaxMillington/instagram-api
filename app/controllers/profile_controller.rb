class ProfileController < ApplicationController

  def show
    @profile = current_user.client.user_recent_media(count: 100).
        paginate(page: params[:page], per_page: 6)
  end

end
