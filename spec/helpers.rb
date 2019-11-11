module Helpers
  def is_logged_in?
    !session[:user_id].nil?
  end

  def logged_in_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_in_as(user, password: 'longpassword')
    post login_path, params: { session: { email: user.email,
                                          password: password }}
  end

  def log_out
    get logout_path
  end
end
