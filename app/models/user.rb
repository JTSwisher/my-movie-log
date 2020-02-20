class User < ActiveRecord::Base 
    has_secure_password
    has_many :movies
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
end 