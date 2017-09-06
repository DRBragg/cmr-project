require 'rails_helper'

feature "Vistor signs in to their account" do
  scenario "User enters valid information to sign in" do
    #will be replaced with factory girl
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_link 'Sign Out'
    # visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "User enters invalid information" do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: 'notauser@email.com'
    fill_in 'user_password', with: 'wrongpassword'
    click_button 'Sign In'

    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Invalid Email or password.")
  end


  scenario "User signs out" do
    #will be replaced with factory girl
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'user_password', with: 'password2'
    fill_in 'Password Confirmation', with: 'password2'
    click_button 'Sign Up'
    click_link 'Sign Out'
    # visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: 'user2@email.com'
    fill_in 'user_password', with: 'password2'
    click_button 'Sign In'
    click_link 'Sign Out'
  
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Signed out successfully.")
  end
end
