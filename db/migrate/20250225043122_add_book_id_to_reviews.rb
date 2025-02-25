class AddBookIdToReviews < ActiveRecord::Migration[8.0]
  def change
    add_column :reviews, :book_id, :integer
  end
end
