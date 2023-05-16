class Site::Auth::RegisterController < ApplicationController
  before_action :redirect_if_authenticated, only: [:register_form]

  def register_form
    @user = User.new

    render "site/auth/register_form"
  end

  def register
    @user = User.new(user_params)
    if @user.save
      # @user.send_confirmation_email!
      login @user
      # remember(@user)

      redirect_to index_path
    else
      render :register_form
    end
  end

  private def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
