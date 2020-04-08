class Product < ApplicationRecord
  belongs_to :thumbnails
  belongs_to :categories
  belongs_to :comments
  has_many :cart_items
end
