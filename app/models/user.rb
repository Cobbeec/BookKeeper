class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :books 
    has_many :authors, through: :books 
    validates :username, :email, presence: true
    validates :username, uniqueness: true 
  

    # def self.create_from_omniauth(auth) 
    #        user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
    #         u.username = auth['info']['first_name']
    #         u.email = auth['info']['email']
    #         u.password = SecureRandom.hex(16)
    # end 
end
