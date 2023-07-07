class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    # @products = Product.select(:id, :name, :price, :quantity).order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
  end

end
