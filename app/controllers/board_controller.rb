class BoardController < ApplicationController

	def index
		@user_info = UserInfo.find(session[:user_id])
		@activities = Post.order("created_at DESC")
		@comment = Comment.new
		if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).filename
		else
			@profpic = "default.jpg"
		end
		@post = Post.new
		@photo = Photo.new
	end
end
