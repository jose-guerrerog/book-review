class AddCategoryIdToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :category_id, :integer
  end
end
