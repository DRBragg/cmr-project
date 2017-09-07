require 'rails_helper'

feature "User visits home page" do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative)}
  scenario "User is not signed in" do
    visit root_path

    expect(page).to have_content(representative1.name)
    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Put a new representative on blast!")
  end

  scenario "User is signed in" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Put a new representative on blast!")
  end
end
