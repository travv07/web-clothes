class ProductsController < ApplicationController
  def index
    @products = Product.ordered_by_price(params["sort_by"]).by_price(params["price"]).paginate(page: params[:page], per_page: 9)
  end
end
