require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do
  before :each do
    @user = User.create!(
      first_name: 'first',
      last_name: 'Last',
      email: 'first@user.com',
      password: '123456789',
      password_confirmation: '123456789'
    )
    end



scenario "They complete an order while logged in" do
  visit '/login'
  save_screenshot

  within 'form' do
    fill_in id: 'email', with: 'first@user.com'
    fill_in id: 'password', with: '123456789'

    click_button 'Submit'
    sleep(2)
    save_screenshot
  end

  expect(page).to have_content 'Products'
  end
end