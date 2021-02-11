class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :users, through: :reviews 
  accepts_nested_attributes_for :author 

def title_and_author 
  "#{self.title}" - "#{self.author}"
end 

end
