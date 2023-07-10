class Admin::ProductsController < ApplicationController

  # index: This method retrieves all products from the database, ordered by id in descending order. The products are assigned to the @products instance variable, which will be available in the corresponding view.
  # The 'Product' model is a subclass of ApplicationRecord
  def index
    @products = Product.order(id: :desc).all
  end

  # new: This method initializes a new instance of the Product model and assigns it to the @product instance variable. This is typically used to display an empty form for creating a new product.
  def new
    @product = Product.new
  end

  # create: This method is called when the form for creating a new product is submitted. It creates a new instance of the Product model using the product_params method (which sanitizes and permits the necessary parameters).
  #  if the product is successfully saved to the database, the user is redirected to the admin products index page with a success notice. Otherwise, if there are validation errors, the new view is rendered again to display the errors.
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  # destroy: This method is called when an admin wants to delete a product. It finds the product by its id parameter, destroys it from the database, and redirects the user to the admin products index page with a success notice.
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  # private: This keyword defines the start of the private section of the controller. The product_params method is defined as a private method to encapsulate the permitted parameters for product creation, preventing direct external access to it.
  private

  # product_params: This private method uses the params.require and params.permit methods to whitelist and sanitize the allowed parameters for product creation. It ensures that only the specified attributes (name, description, category_id, quantity, image, and price) are permitted and passed to the Product.new method for creation.
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
