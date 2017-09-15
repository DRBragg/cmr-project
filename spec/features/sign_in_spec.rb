require 'rails_helper'

feature "Vistor signs in to their account", js: true do
  scenario "User enters valid information to sign in" do
    visit root_path
    click_on 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    click_on 'Sign Out'

    click_link 'Sign In'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'password', with: 'password'
    click_button 'Sign In'

    expect(page).to_not have_content("Incorrect Username/Password.")
  end

  scenario "User enters invalid information" do
    visit root_path
    click_on 'Sign In'

    fill_in 'Email', with: 'notauser@email.com'
    fill_in 'password', with: 'wrongpassword'
    click_button 'Sign In'

    expect(page).to have_content("Incorrect Username/Password.")
  end


  scenario "User signs out" do
    visit root_path
    click_on 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user2@email.com'
    fill_in 'user_password', with: 'password2'
    fill_in 'Password Confirmation', with: 'password2'
    click_button 'Sign Up'
    click_on 'Sign Out'

    click_on 'Sign In'

    fill_in 'Email', with: 'user2@email.com'
    fill_in 'password', with: 'password2'
    click_button'Sign In'
    click_on 'Sign Out'

    expect(page).to_not have_content("Incorrect Username/Password.")
  end
end
