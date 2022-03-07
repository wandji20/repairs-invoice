require 'rails_helper'

feature 'creating an invoice' do
  before(:each) do
    User.create(
      email: 'user@example.com',
      username: 'username',
      password: 'capline',
      admin: true,
      password_confirmation: 'capline'
    )
    Part.create(name: 'engine', total: 20, price: 3000)
    visit new_session_path
    fill_in 'session_email', with: 'user@example.com'
    fill_in 'session_password', with: 'capline'
    click_button 'Log in'
  end

  it 'creates a new invoice', js: true do
    Part.create(name: 'engine', total: 20, price: 3000)
    visit new_invoice_path
    fill_in 'invoice_email', with: 'user@example.com'
    fill_in 'invoice_name', with: 'capline'
    click_link 'Add Part'
    click_button '+'
    click_button '+'
    click_button 'Create Invoice'
    expect(page).to have_content '9000'
    expect(page).to have_content 'Invoice successfully created'
  end

  it 'creates a new invoice', js: true do
    Part.create(name: 'engine', total: 20, price: 3000)
    visit new_invoice_path
    fill_in 'invoice_email', with: 'user@example.com'
    fill_in 'invoice_name', with: 'capline'
    click_button 'Create Invoice'
    expect(page).to have_content 'You cannot create an invoice without any items'
  end
end
