class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :users, foreign_key: true
      t.text :address_ship
      t.integer :shipper_id
      t.datetime :date_ship
      t.integer :status

      t.timestamps
    end
  end
end
