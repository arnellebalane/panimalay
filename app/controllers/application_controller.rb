class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private

  def require_login
  	if !session[:user_id]
  		flash[:alert] = "You're not logged in!"
  		redirect_to new_session_path
  	end
  end

end
