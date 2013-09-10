module ApplicationHelper
  def user_signed_in?
    !session[:user_id].nil?
  end

  def current_page?(controller, action = nil)
    if action
      controller_name == controller && action_name == action
    else
      controller_name == controller
    end
  end

  def body_classes
    "#{controller_name} #{action_name}"
  end
end
