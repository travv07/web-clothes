class FixCategoryNameProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :category_id, :categories_id
  end
end
