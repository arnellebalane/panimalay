module ApplicationHelper
  def user_signed_in?
    session[:user_id] == true
  end

  def current_page?(controller)
    controller_name == controller
  end
end
