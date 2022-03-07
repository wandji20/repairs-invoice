require 'rails_helper'

feature 'Signing in' do
  background do
    User.create(
      email: 'user@example.com',
      username: 'username',
      password: 'capline',
      password_confirmation: 'capline'
    )
  end

  scenario 'Signing in with correct credentials' do
    visit new_session_path
    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'capline'

    click_button 'Log in'
    expect(page).to have_content 'You have successfully logged in'
  end

  given(:other_user) do
    User.create(
      email: 'other@example.com',
      password: 'rousel',
      username: 'othername',
      password: 'rousel',
      password_confirmation: 'rousel'
    )
  end

  scenario 'Signing in as another user' do
    visit '/sessions/new'
    fill_in 'session_email', with: other_user.email
    fill_in 'session_password', with: 'rousels'

    click_button 'Log in'
    expect(page).to have_content 'Invalid Credentials'
  end
end
