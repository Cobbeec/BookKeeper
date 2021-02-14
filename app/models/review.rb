class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user 
  
  validates :title, :content, presence: true 

end
