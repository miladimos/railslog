class Site::Auth::PasswordController < ApplicationController
  def forgot_form
  end

  def forgot
    @user = User.find_by(email: params[:email])
    if @user.present?
      ForgotPasswordMailer.with(user: @user).reset.deliver_later
    else
      redirect_to forgot_form_path, alert: "email not found"
    end
  end

  def reset_form
  end

  def reset
  end
end
