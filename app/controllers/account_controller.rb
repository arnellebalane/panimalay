class AccountController < ApplicationController

	def index
		@user = User.find(session[:user_id]);
		@user_info = UserInfo.find(@user.user_info)
		@posts = @user.posts.order("created_at DESC")
		if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).filename
		else
			@profpic = "default.jpg"
		end
	end

	def show
		@user = User.find(params[:id]);
		@user_info = UserInfo.find(@user.user_info)
		@posts = @user.posts.order("created_at DESC")
		if @user_info.photo_id
			@profpic = Photo.find(@user_info.photo_id).filename
		else
			@profpic = "default.jpg"
		end
		render :template => "account/index"
	end

end
