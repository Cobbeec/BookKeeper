class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  scope :alpha, -> { order(:title) }
  validates :title, :content, presence: true 

end
