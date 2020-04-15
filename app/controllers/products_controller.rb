class ProductsController < ApplicationController

  before_action :load_product, only: :show

  def index
    @products = Product.ordered_by_price(params["sort_by"]).by_price(params["price"]).paginate(page: params[:page], per_page: 9)
  end

  def show
    @products_active = Product.by_category(@product.category_id).by_not_product(@product).limit(4)
    @products = Product.by_category(@product.category_id).by_not_product(@product).offset(4)
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash["danger"] = "Product not found"
    redirect_to products_path
  end
end
