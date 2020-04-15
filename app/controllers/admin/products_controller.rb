class Admin::ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :load_product, only: [:edit, :update, :update_image, :edit_image, :destroy]
  def index
    @products = Product.paginate(page: params[:page], per_page: 12)
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "created product success"
      redirect_to admin_products_path
    else
      respond_to do |format|
        format.js
      end
    end

  end

  def edit; end

  def edit_image
    respond_to do |format|
      format.js
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = "Updated product success"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Deleted product success"
      redirect_to admin_products_path
    else
      flash[:error] = "Delete product not success"
      redirect_to admin_products_path
    end
  end

  def update_image
    if @product.update_attributes image_product_param
      flash[:success] = "Updated product success"
      redirect_to admin_products_path
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash["danger"] = "Product not found"
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit :name, :description, :quantity, :price, :discount, :category_id
  end

  def image_product_param
    params.require(:product).permit :image
  end
end
