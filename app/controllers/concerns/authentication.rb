module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_logged_in?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to index_path, alert: "You are already logged in." if user_logged_in?
  end

  def redirect_if_not_authenticated
    redirect_to index_path if not user_logged_in?
  end

  private

  def current_user
    Current.user ||= if session[:current_user_id].present?
        User.find_by(id: session[:current_user_id])
      elsif cookies.permanent.encrypted[:remember_token].present?
        User.find_by(remember_token: cookies.permanent.encrypted[:remember_token])
      end
  end

  def user_logged_in?
    Current.user.present?
  end

  def forget(user)
    cookies.delete :remember_token
    user.regenerate_remember_token
  end

  def remember(user)
    user.regenerate_remember_token
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end

  # online users -> User.where("last_login_at > ?", 5.minutes.ago)
end
