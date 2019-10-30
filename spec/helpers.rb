module Helpers
  def is_logged_in?
    !session[:user_id].nil?
  end

  def logged_in_user
    User.find(session[:user_id])
  end
end
