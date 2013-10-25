class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :path_to_photo, :current_user, :user_logged_in?
  before_filter :require_login

  private

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def user_logged_in?
      !!session[:user_id]
    end

    def path_to_photo(filename)
      RAILS_ROOT + "/photos/" + filename
    end

    def require_login
    	if !session[:user_id]
    		flash[:alert] = "You're not logged in!"
    		redirect_to new_session_path
    	end
    end

end
