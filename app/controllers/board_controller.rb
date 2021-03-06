class BoardController < ApplicationController
	def index
		@user_info = UserInfo.find(session[:user_id])
		@activities = Post.order("created_at DESC")
		@activities += Photo.order("created_at DESC")
		@activities.sort_by!{|act| act.created_at}
		@comment = Comment.new
		if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).id.to_s
		else
			@profpic = "0"
		end
		@post = Post.new
		@photo = Photo.new

	date_start = Date.today.tomorrow.beginning_of_week.yesterday
    date_end = date_start.tomorrow.end_of_week.yesterday
    @events = Event.where(:event_date => date_start..date_end).order("event_date")
	end
end
