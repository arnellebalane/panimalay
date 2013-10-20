class AnnouncementsController < ApplicationController
  def index
    @user_info = UserInfo.find(session[:user_id])
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).filename
    else
      @profpic = "default.jpg"
    end
  end
end
