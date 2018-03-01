class User < ActiveRecord::Base
    has_secure_password # gem bcrypt
    has_many :articles, dependent: :destroy
    has_many :transactions
    before_save { self.email = email.downcase }
    validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # @ in email 
    validates :email, presence: true, length: { maximum: 105 },
    uniqueness: { case_sensitive: false }, # A && a is the same
    format: { with: VALID_EMAIL_REGEX }
end