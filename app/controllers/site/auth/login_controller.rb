class Site::Auth::LoginController < ApplicationController
  before_action :redirect_if_authenticated, only: [:login_form]

  def login_form
    @user = User.new
    render "site/auth/login_form"
  end

  def login
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user.present? && @user.authenticate(params[:user][:password])
      login @user
      remember(@user) if params[:user][:remember_me] == "1"

      redirect_to site_path
    else
      puts "Invalid password or email--------------------------------------------"
    end
  end

  def logout
    forget(current_user)
    logout
    redirect_to root_path
  end
end
