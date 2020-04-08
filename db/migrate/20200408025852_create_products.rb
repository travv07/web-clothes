class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :thumbnails, foreign_key: true
      t.references :categories, foreign_key: true
      t.references :comments, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
