module SessionsHelper
  def in_signin_page?
    controller_name == "sessions" and action_name == "new"
  end
end
