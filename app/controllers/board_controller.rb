class BoardController < ApplicationController

	def index
		if (!session[:user_id])
			redirect_to new_session_path
		else
			@user_info = UserInfo.find(session[:user_id])
			@activities = Post.order("created_at DESC")
			@post = Post.new
		end
	end

end
