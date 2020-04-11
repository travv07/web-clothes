class AddProductToThumbnails < ActiveRecord::Migration[5.1]
  def change
    add_reference :thumbnails, :product, foreign_key: true
  end
end
