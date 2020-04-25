class Product < ApplicationRecord
  acts_as_paranoid
  mount_uploader :image, AvatarUploader
  has_many :thumbnails
  belongs_to :category
  has_many :comments
  has_many :cart_items

  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

  scope :ordered_by_price, -> (sort_params) {
    if sort_params == "desc"
      order(price: :desc)
    elsif sort_params == "asc"
      order(price: :asc)
    else
      order(id: :desc)
    end
  }
  scope :by_price, -> (price_param) {
    if price_param == "max_50"
      where("price <= 50")
    elsif price_param == "min_50_max_100"
      where("price between 50 and 100")
    elsif price_param == "min_100_max_1000"
      where("price between 100 and 1000")
    else
      all
    end
  }

  scope :by_category, -> (category) {where("category_id = ?", category)}
  scope :by_not_product, -> (product_id) {where.not("id = ?", product_id)}
end
