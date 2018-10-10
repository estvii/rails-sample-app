class User < ApplicationRecord
    #validates :name, presence: true #same as validates(:name, presence: true)
    #validates :email, presence: true
    before_save { self.email = self.email.downcase }
    #before_save { email.downcase! } works as well
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    # /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i old regex
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, 
                uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
   
end
