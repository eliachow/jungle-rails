# sets up the environment and includes necessary configurations for running RSpec tests.
require 'rails_helper'


RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # Each example is run in isolation using before(:each) to set up a fresh instance of @category and @product before each example.
    before(:each) do
      @category = Category.create(name: 'category')
      @product = Product.new(
        name: 'Product',
        price: 10.99,
        quantity: 5,
        category: @category
      )
    end

    # checks if a product is valid when all four fields are set
    it "is valid with all four fields set" do
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
