module UsersHelper
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end
  def logged_in?
    !current_user.nil?
  end
  def force_login
    if !logged_in?
    redirect_to sessions_path
    end
  end
end
