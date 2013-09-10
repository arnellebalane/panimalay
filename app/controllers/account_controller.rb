class AccountController < ApplicationController

	def index
		@user_info = UserInfo.find(session[:user_id])
		@user= User.find(session[:user_id]);
	end

	def show
		
	end

end
