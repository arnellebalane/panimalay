class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :path_to_photo
  before_filter :require_login

  private

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
