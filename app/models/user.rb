class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :books 

    validates :username, :email, presence: true
    validates :username, uniqueness: true 

    scope :most_reviews, -> {joins(:reviews).group('users.id').order('count(users.id) desc')} 



 
end
