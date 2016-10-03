require 'rails_helper'

feature 'Creating a new user' do
  before do
    visit '/'
    # added the line below because I have two Register links available
    # and I want to test to only consider the first
    first(:link, 'Register').click
    click_link 'Register'
  end

  scenario 'can create a new user from the index page' do
    fill_in 'Email', with: 'fake@email.com'
    fill_in 'User Name', with: 'fakeuser'
    fill_in 'Password', with: 'fakepassword'
    fill_in 'Confirm Password', with: 'fakepassword'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'fake@email.com'
    fill_in 'Password', with: 'fakepassword'
    fill_in 'Confirm Password', with: 'fakepassword'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'User Name', with: 'h'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Confirm Password', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end

  scenario 'requires a user name to be less than 25 characters' do
    fill_in 'User Name', with: 'h' * 26
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Confirm Password', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 25 characters")
  end
end
