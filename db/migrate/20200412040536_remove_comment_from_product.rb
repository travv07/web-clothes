class RemoveCommentFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_reference :products, :comments, foreign_key: true
  end
end
