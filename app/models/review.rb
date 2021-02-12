class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :book_title, :title, :content, presence: true 

end
