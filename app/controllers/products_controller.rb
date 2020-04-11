class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 9)
  end
end
