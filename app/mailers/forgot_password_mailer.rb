class ForgotPasswordMailer < ApplicationMailer
  def reset
    @user = params[:user]
    @url = ""
    mail(to: @user.email, subject: "")
  end

  def password_reset(user, password_reset_token)
    @user = user
    @password_reset_token = password_reset_token

    mail to: @user.email, subject: "Password Reset Instructions"
  end
end
