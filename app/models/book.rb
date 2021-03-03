class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :users, through: :reviews 
  scope :alpha, -> { order(:title) }

  validates :title, presence: true 
  validates :title, uniqueness: true 

  def author_attributes=(attr)
    if !attr[:name].blank?
        self.author= Author.find_or_create_by(name: attr[:name])
    end  
end



end
