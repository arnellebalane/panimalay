class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :path_to_photo

  def path_to_photo(filename)
    RAILS_ROOT + "/public/" + filename
  end
end
