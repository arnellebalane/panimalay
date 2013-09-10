class AccountController < ApplicationController

	def index
		@user = User.find(session[:user_id]);
		@user_info = UserInfo.find(@user.user_info)
	end

	def show
		@user = User.find(params[:id]);
		@user_info = UserInfo.find(@user.user_info)
		render :template => "account/index"
	end

end
