class Product < ApplicationRecord
  acts_as_paranoid
  mount_uploader :image, AvatarUploader
  has_many :thumbnails
  belongs_to :categories, optional: true
  belongs_to :comments, optional: true
  has_many :cart_items

  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
