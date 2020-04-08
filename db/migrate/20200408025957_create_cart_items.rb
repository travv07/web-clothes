class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :carts, foreign_key: true
      t.references :products, foreign_key: true
      t.decimal :price
      t.integer :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
