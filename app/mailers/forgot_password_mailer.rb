class ForgotPasswordMailer < ApplicationMailer
  def reset
    @user = params[:user]
    @url = ""
    mail(to: @user.email, subject: "")
  end
end
