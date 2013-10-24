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
    description = params[:event][:description]
    venue = params[:event][:venue]
    date = params[:event][:event_date]
    category = params[:event][:event_categories_id]
    if !title or !date
      flash[:alert] = "Please fill up all the fields!"
      redirect_to :back and return
    end
    event = Event.new
    event.title = title
    event.description = description
    event.venue = venue
    event.event_date = date
    event.event_categories_id = category
    event.user_id = session[:user_id]

    if  event.save
      flash[:notice] = "New event created successfully!"
    else
      flash[:alert] = "Event was not created!"
    end
    redirect_to :back
  end
end
