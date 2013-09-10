class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new 
  	if (session[:user_id])
  		redirect_to board_index_path
  	end
  end

  def create
    if (@user = User.where("email = ? AND password = ?", params[:user][:email], params[:user][:password])).length > 0
      @user.each do |user|
        session[:user_id] =  user.id
      end
      redirect_to board_index_path
    elsif (@user = User.where("email = ?", params[:user][:email])).length > 0
      flash[:error] = "Wrong password"
      flash[:email] = params[:user][:email]
      redirect_to new_session_path
    else
      flash[:error] = "Wrong email and password"
      redirect_to new_session_path
    end
  end

  def destroy
  	session[:user_id] =  nil
  	redirect_to new_session_path
  end
end
