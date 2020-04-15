class RemoveCategoriesFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_reference :products, :categories, foreign_key: true
  end
end
