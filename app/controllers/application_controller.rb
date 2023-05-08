class ApplicationController < ActionController::Base
  # include Authentication
  include Pagy::Backend

  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to login_page_form_path, alert: "" if Current.user.nil?
  end
end
