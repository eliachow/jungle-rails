class Admin::CategoriesController < ApplicationController
  # define the index action to retrieve a list of all categories and assign them to an instance variable.
  def index
    @categories = Category.all
  end

  # define the new action to instantiate a new category object and assign it to an instance variable. This will be used in the form to create a new category.
  def new
    @category = Category.new
  end

  # implement create action: Add the create action to the CategoriesController to handle the creation of a new category. Retrieve the submitted form data, create a new category object, and save it to the database. Handle any success or error scenarios accordingly.
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
