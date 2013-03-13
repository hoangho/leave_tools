class User < ActiveRecord::Base
  	attr_accessible :admin, :balance, :email, :first_name, :last_name, :password, :password_confirmation
  	has_secure_password

  	before_save { |user| user.email = email.downcase }
  	before_save :create_remember_token

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

	private

	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end
end
