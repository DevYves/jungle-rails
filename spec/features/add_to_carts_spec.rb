require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end




scenario "They click on add to cart and the cart's item count is updated on the home page" do
  # ACT
  visit root_path
  save_screenshot

  first('article.product').find_link('Add').click
  sleep(2)


  # DEBUG / VERIFY
  save_screenshot
  puts page.html
  expect(page).to have_content 'My Cart (1)'
  end




end
