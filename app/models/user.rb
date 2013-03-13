class User < ActiveRecord::Base
	attr_accessible :admin, :balance, :email, :first_name, :last_name, :identifier_url, :user_type_id

  belongs_to :user_type
  has_many :leave_requests
  
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def full_name
    first_name + " " +  last_name
  end

  def admin?
    self.email == "hoang.ho@techpropulsionlabs.com"
  end

	private

	    def create_remember_token
	      self.remember_token = SecureRandom.urlsafe_base64
	    end
end
