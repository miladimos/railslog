class User < ApplicationRecord
    has_secure_password

    before_save :downcase_email

    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

    def confirm!
        update_columns(confirmed_at: Time.current)
    end

    def confirmed?
    confirmed_at.present?
    end
    
    private def downcase_email
        self.email = email.downcase
    end
end
