class AccountController < ApplicationController

	def index
		@user = User.find(session[:user_id]);
		@user_info = @user.user_info
		@activities = Post.where(user_id: @user.id).order("created_at DESC")
	end

	def show
		@user = User.find(params[:id]);
		@user_info = @user.user_info
		@activities = Post.where(user_id: @user.id).order("created_at DESC")
		render :template => "account/index"
	end

end
