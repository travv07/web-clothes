class CreateThumbnails < ActiveRecord::Migration[5.1]
  def change
    create_table :thumbnails do |t|
      t.string :image

      t.timestamps
    end
  end
end
