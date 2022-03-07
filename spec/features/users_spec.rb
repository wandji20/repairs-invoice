require 'rails_helper'

describe 'the signup process', type: :feature do
  it 'creates a new user' do
    visit new_user_path
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_username', with: 'username'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Account successfully created'
  end

  it 'creates a new user' do
    visit new_user_path
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Username can\'t be blank Password confirmation can\'t be blank'
  end
end
