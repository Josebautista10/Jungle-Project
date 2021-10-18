require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product successfully' do

      @category = Category.new(name: 'Toys')

      @product = Product.new(
        name: 'Trex',
        price_cents: '10000',
        quantity: '40',
        category: @category
      )

      expect(@product).to be_valid
    end

    it 'should not be valid if product does not have a name' do
      @category = Category.new(name: 'Toys')

      @product = Product.new(
        name: nil,
        price_cents: '10000',
        quantity: '40',
        category: @category
      )

      expect(@product).to_not be_valid
    end

    it 'should not be valid if product does not have a price' do
      @category = Category.new(name: 'Toys')

      @product = Product.new(
        name: 'Trex',
        price_cents: nil,
        quantity: 4,
        category: @category
      )

      expect(@product).to_not be_valid
    end

    it 'should not be valid if product does not have a quantity' do
      @category = Category.new(name: 'Toys')

      @product = Product.new(
        name: 'Trex',
        price_cents: 10000,
        quantity: nil,
        category: @category
      )

      expect(@product).to_not be_valid
    end

    it 'should not be valid if product does not have a quantity' do
      @category = Category.new(name: 'Toys')

      @product = Product.new(
        name: 'Trex',
        price_cents: 10000,
        quantity: 4,
        category: nil
      )

      expect(@product).to_not be_valid
    end
  end
end
