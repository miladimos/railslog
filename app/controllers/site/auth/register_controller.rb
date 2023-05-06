class Site::Auth::RegisterController < ApplicationController
  def register_form
    @user = User.new

    render "site/auth/register_form"
  end

  def register
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to index_path
    else
      render :register_form
    end
  end

  private def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
