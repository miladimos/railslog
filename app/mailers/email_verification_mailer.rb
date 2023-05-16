class EmailVerificationMailer < ApplicationMailer
  def send(user, token)
    @user = user
    @token = token

    mail to: @user.email, subject: "Confirmation Email"
  end
end
