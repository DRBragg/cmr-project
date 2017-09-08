require 'rails_helper'

feature "User visits profile page to edit" do
  let!(:user2) {FactoryGirl.create(:user)}

  scenario "User updates information successfully" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "user_password", with: user2.password
    click_button "Sign In"

    click_link user2.first_name

    fill_in "First Name", with: "Tim"
    fill_in "Last Name", with: "Browne"
    fill_in "user_current_password", with: "password"
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "User does not supply correct password" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "user_password", with: user2.password
    click_button "Sign In"

    click_link user2.first_name

    fill_in "First Name", with: "Tim"
    fill_in "Last Name", with: "Browne"
    fill_in "user_current_password", with: "Password"
    click_button "Update"

    expect(page).to_not have_content("Your account has been updated successfully.")
    expect(page).to have_content("Current password is invalid")
  end
end
