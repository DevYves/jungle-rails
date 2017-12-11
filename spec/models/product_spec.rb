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
      expect(product.errors.full_messages).to include('Product Validations should not be valid without a name')
    end
    it 'should not be valid without a price' do
      category = Category.create!(name: 'Furniture')
      product = Product.create!(name: 'Hipster Box', price: nil, quantity: 10, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Product Validations should not be valid without a price')
    end
    it 'should not be valid without a quantity' do
      category = Category.create!(name: 'Furniture')
      product = Product.create!(name: 'Hipster Box', price: 10, quantity: nil, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Product Validations should not be valid without a quanitity')
    end
    it 'should not be valid without a category' do
      product = Product.create!(name: 'Hipster Box', price: 10, quantity: 10, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Product Validations should not be valid without a category')
    end
  end
end




## One example per each of these:
# validates :name, presence: true
#     validates :price, presence: true
#     validates :quantity, presence: true
#     validates :category, presence: true


# require 'rails_helper'

# RSpec.describe Snake, type: :model do

#   it 'should not be valid without a species' do
#     snake = Snake.new
#     expect(snake).to_not be_valid
#     expect(snake.errors.full_messages).to include('Species can\'t be blank')
#   end

#   it 'should be valid with a species' do
#     snake = Snake.new(species: 'rattle')
#     expect(snake).to be_valid
#   end

# end


# require 'rails_helper'

# RSpec.describe Plane, type: :model do

#   describe '#can_take_off?' do

#     it 'returns true if there are no snakes on the plane' do
#       plane = Plane.create!
#       expect(plane.can_take_off?).to be(true)
#     end

#     it 'returns false if there are any snakes on the plane' do
#       plane = Plane.create!
#       snake = Snake.create!(species: 'rattle', plane: plane)
#       expect(plane.can_take_off?).to be(false)
#     end

#     it 'returns false if there are any snakes on the plane' do
#       plane = Plane.create!
#       snake = Snake.create!(species: 'rattle', plane: plane)
#       snake.destroy!
#       # TASK FOR YOU: there appears to be a problem with this test.
#       # How would you debug the output to find out what's wrong with
#       # this test and how to fix it? Read carefully.
#       expect(plane.reload.can_take_off?).to be(false)
#     end

#   end

# end