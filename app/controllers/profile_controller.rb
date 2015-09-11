class ProfileController < ApplicationController

  before_action :authorize!

  def show
    @profile = current_user.client.user_recent_media(count: 100).
        paginate(page: params[:page], per_page: 9)
    respond_to do |format|
      format.html
      format.js
    end
  end

end
