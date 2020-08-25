require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new
    @category.name = "Test Cat"
    @category.save!
  end
  
  it "adds product with all fields" do
    @product = Product.new
    @product.name = "New Test Product"
    @product.price = 7800
    @product.quantity = 10
    @product.category = @category
    @product.save!
  end

  it "validates presence of name" do
    @product = Product.new
    # @product.name = "New Test Product"
    @product.price = 7800
    @product.quantity = 10
    @product.category = @category
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ['Name can\'t be blank']
  end

  it "validates presence of price" do
    @product = Product.new
    @product.name = "New Test Product"
    # @product.price = 7800
    @product.quantity = 10
    @product.category = @category
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
  end

  it "validates presence of quantity" do
    @product = Product.new
    @product.name = "New Test Product"
    @product.price = 7800
    # @product.quantity = 10
    @product.category = @category
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
  end

  it "validates presence of quantity" do
    @product = Product.new
    @product.name = "New Test Product"
    @product.price = 7800
    @product.quantity = 10
    # @product.category = @category
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Category can't be blank"]
  end

end
