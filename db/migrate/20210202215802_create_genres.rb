class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.has_many :books

      t.timestamps
    end
  end
end
