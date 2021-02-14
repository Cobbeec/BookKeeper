class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :books 
    has_many :authors, through: :books 
    validates :username, :email, presence: true
    validates :username, uniqueness: true 
  

 
end
