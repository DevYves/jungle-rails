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

  scenario "They click on a product's details and visit the details page" do
  # ACT
  visit root_path
  save_screenshot


  first('article.product').find_link('Details').click
  sleep(2)


  # DEBUG / VERIFY
  save_screenshot
  puts page.html

  end


end
