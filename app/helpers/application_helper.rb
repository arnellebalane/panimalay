module ApplicationHelper
  def user_signed_in?
    !session[:user_id].nil?
  end

  def current_page?(controller)
    controller_name == controller
  end

  def body_classes
    "#{controller_name} #{action_name}"
  end
end
