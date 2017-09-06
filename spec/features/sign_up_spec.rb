require 'rails_helper'

feature "Vistor signs up as a new user" do
  scenario "specifies vaild and required information" do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")
  end

  scenario "required information is not supplied" do
    visit root_path
    click_link 'Sign Up'

    click_button 'Sign Up'

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("can't be blank")
  end

  scenario "password confirmation does not match" do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'passwordConfirmation'
    click_button 'Sign Up'

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("doesn't match Password")
  end
end
