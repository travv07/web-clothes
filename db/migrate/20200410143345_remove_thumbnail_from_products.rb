class RemoveThumbnailFromProducts < ActiveRecord::Migration[5.1]
  def change

    remove_reference :products, :thumbnails, foreign_key: true
  end
end
