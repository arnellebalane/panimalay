class AnnouncementsController < ApplicationController
  def index
    @user_info = UserInfo.find(session[:user_id])
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).filename
    else
      @profpic = "default.jpg"
    end
    @announcements = Announcement.order("created_at DESC")
  end

  def create
  	if (params[:announcement][:title] and params[:announcement][:content]) 
  		@announcement = Announcement.new(title: params[:announcement][:title], content: params[:announcement][:content], privacy: params[:announcement][:privacy], user_id: session[:user_id])
  		if @announcement.save
  			flash[:notice] = "Announcement posted!"
  		else
  			flash[:alert] = "Error in posting announcement!"
  		end
  	else
  		flash[:alert] = "Please fill-up all the fields!"
  	end
  	redirect_to :announcements
  end
end