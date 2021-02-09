class AddBookTitleToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :book_title, :string
  end
end
