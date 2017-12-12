require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid' do
      category = Category.create!(name: 'Furniture')
      product = Product.create!(name: 'Hipster Box', price: 10, quantity: 10, category: category)
      expect(product).to be_valid
    end
    it 'should not be valid without a name' do
      category = Category.create!(name: 'Furniture')
      product = Product.new(name: nil, price: 10, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Name can\'t be blank')
    end
      it 'should not be valid without a price' do
      category = Category.create!(name: 'Furniture')
      product = Product.new(name: 'Hipster Box', price: nil, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Price can\'t be blank')

    end
    it 'should not be valid without a price' do
      category = Category.create!(name: 'Furniture')
      product = Product.new(name: 'Hipster Box', price: 10, quantity: nil, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Quantity can\'t be blank')
    end
    it 'should not be valid without a category' do
      category = Category.create!(name: 'Furniture')
      product = Product.new(name: 'Hipster Box', price: 10, quantity: 10, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Category can\'t be blank')
    end
  end
end


