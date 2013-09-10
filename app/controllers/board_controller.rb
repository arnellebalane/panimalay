class BoardController < ApplicationController

	def index
		@user_info = UserInfo.find(session[:user_id])
		@activities = Post.order("created_at DESC")
		@post = Post.new
	end

end
