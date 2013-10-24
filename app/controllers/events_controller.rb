class EventsController < ApplicationController
  include CalendarMagic

  def index
    @user = User.find(session[:user_id]);
    @user_info = @user.user_info
    if @user_info.photo_id
      @profpic = Photo.find(@user_info.photo_id).filename
    else
      @profpic = "default.jpg"
    end
    month = Date.today.month
    year = Date.today.year
    month = params[:month].to_i if params[:month]
    year = params[:year].to_i if params[:year]
    @calendar = CalendarMagic::CalendarGenerator.generate_month(month, year)
  end

  def create
    title = params[:event][:title]
  end
end
