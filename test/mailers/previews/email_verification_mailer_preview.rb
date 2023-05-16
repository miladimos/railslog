# Preview all emails at http://localhost:3000/rails/mailers/email_verification_mailer
class EmailVerificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_verification_mailer/send
  def send
    EmailVerificationMailer.send
  end

end
