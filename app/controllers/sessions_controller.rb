class SessionsController < ApplicationController
  def new 
  	if (session[:user_id])
  		redirect_to account_index_path
  	end
  end

  def create
  	@user = User.where("email = ? AND password = ?", params[:user][:email], params[:user][:password])
  	if (@user.length > 0)
  		@user.each do |user|
  			session[:user_id] =  user.id
  		end
  		redirect_to board_index_path
  	else
  		flash[:error] = "Wrong email or password" 
  		redirect_to new_session_path
  	end
  end

  def destroy
  	session[:user_id] =  nil
  	redirect_to new_session_path
  end
end
