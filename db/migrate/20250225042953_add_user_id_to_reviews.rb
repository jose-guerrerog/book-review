class AddUserIdToReviews < ActiveRecord::Migration[8.0]
  def change
    add_column :reviews, :user_id, :integer
  end
end
