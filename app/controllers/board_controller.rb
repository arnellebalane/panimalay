class BoardController < ApplicationController

	def index
		if (!session[:user_id])
			redirect_to new_session_path
		end
		@user = User.new
	end

end
