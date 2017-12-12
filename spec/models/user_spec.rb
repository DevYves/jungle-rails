require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should have first_name, last_name, email, password, password_confirmation to be valid' do
      user = User.create! first_name: 'yves', last_name: 'lastname', email: 'example@email.com', password: 'password', password_confirmation: 'password'
      expect(user).to be_valid
    end

    it 'should not be valid without a first name' do
      user = User.new first_name: nil, last_name: 'last', email: 'example@email.com', password: 'password', password_confirmation: 'password'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can\'t be blank")
    end

    it 'should not be valid without a last name' do
      user = User.new first_name: 'yves', last_name: nil, email: 'example@email.com', password: 'password', password_confirmation: 'password'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Last name can\'t be blank')
    end

    it 'should not be valid without an email' do
      user = User.new first_name: 'yves', last_name: 'lastname', email: nil, password: 'password', password_confirmation: 'password'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'should not be valid without password' do
      user = User.new first_name: 'yves', last_name: 'lastname', email: 'example@email.com', password: nil, password_confirmation: 'nil'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password can\'t be blank')
    end

    it 'should not be valid without matching password and confirmation' do
      user = User.new first_name: 'yves', last_name: 'lastname', email: 'example@email.com', password: 'password', password_confirmation: 'hotdogs'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end

    it 'should not be valid with password shorter than 8 characters' do
      user = User.new first_name: 'yves', last_name: 'lastname', email: 'example@email.com', password: 'short', password_confirmation: 'short'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
    end

    it 'emails should be unique' do
      user1 = User.create first_name: 'yves', last_name: 'lastname', email: 'uppercase@email.com', password: 'password', password_confirmation: 'password'
      user2 = User.new first_name: 'bob', last_name: 'lastname', email: 'UPPERCASE@email.com', password: 'password', password_confirmation: 'password'
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should' do
      user = User.create! first_name: 'yves', last_name: 'lastname', email: 'example@email.com', password: 'password', password_confirmation: 'password'
      user_auth = User.authenticate_with_credentials('example@email.com', 'password')
      expect(user_auth).to be_valid
    end

    it 'should be nil with wrong password' do
      user = User.create! first_name: 'yves', last_name: 'lastname', email: 'email@email.com', password: 'password', password_confirmation: 'password'
      user_auth = User.authenticate_with_credentials('email@email.com', 'password2')
      expect(user_auth).to be_nil
    end

    it 'should be nil with email that doesn\'t exist' do
      user = User.create! first_name: 'yves', last_name: 'lastname', email: 'example@email.com', password: 'password', password_confirmation: 'password'
      user_auth = User.authenticate_with_credentials('invalidemail@email.com', 'password')
      expect(user_auth).to be_nil
    end

    it 'should be valid with email with __ __ spaces before and after' do
      user = User.create! first_name: 'yves', last_name: 'lastname', email: 'email@email.com', password: 'password', password_confirmation: 'password'
      user_auth = User.authenticate_with_credentials('  email@email.com  ', 'password')
      expect(user_auth).to be_valid
    end

    it 'should be valid with emails with dif case' do
      user = User.create! first_name: 'yves', last_name: 'lastname', email: 'uppercase@email.com', password: 'password', password_confirmation: 'password'
      user_auth = User.authenticate_with_credentials('UPPERCASE@email.CoM', 'password')
      expect(user_auth).to be_valid
    end
  end
end
