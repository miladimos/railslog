class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes
  PASSWORD_RESET_TOKEN_EXPIRATION = 10.minutes
  has_secure_token :remember_token

  has_secure_password
  # has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def confirm_email!
    update_columns(email_confirmed_at: Time.current)
  end

  def confirmed?
    email_confirmed_at.present?
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    UserMailer.send(self, confirmation_token).deliver_now
  end

  private def downcase_email
    self.email = email.downcase
  end

  def generate_password_reset_token
    signed_id expires_in: PASSWORD_RESET_TOKEN_EXPIRATION, purpose: :reset_password
  end

  def send_password_reset_email!
    password_reset_token = generate_password_reset_token
    UserMailer.password_reset(self, password_reset_token).deliver_now
  end

  def isOnline
  end
end
