class Site::Auth::LoginController < ApplicationController
  def login_form
    render "site/auth/login_form"
  end

  def login
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to site_path
    else
      "Invalid password or email"
    end
  end

  def logout
    session[:user_id] = nil
  end
end
