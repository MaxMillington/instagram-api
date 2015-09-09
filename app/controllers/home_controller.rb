class HomeController < ApplicationController

  def index
    @instagram = Instagram.user_recent_media("user_id_here", {:count => 1})
  end

  def show

  end
end
