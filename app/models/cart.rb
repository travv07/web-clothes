class Cart < ApplicationRecord
  belongs_to :users
  has_many :cart_items
end
