require 'rails_helper'

feature "User visits home page looking for profile picture", js: true, server_rendering: true do
  let!(:user2) {FactoryGirl.create(:user, avatar: nil)}
  let!(:representative1) {FactoryGirl.create(:representative)}

  scenario "User with avatar is signed up and upload is successful" do
    visit root_path
    click_link "Sign Up"

    fill_in "First Name", with: "Tim"
    fill_in "Last Name", with: "Browne"
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    attach_file :user_avatar, File.join(Rails.root, 'spec','fixtures','image.jpg')

    click_button "Sign Up"

    expect(page).to have_css("img[src*='image.jpg']")
  end

  scenario "User without avatar is signed up" do
    visit root_path
    click_link "Sign In"
    
    fill_in "Email", with: user2.email
    fill_in "user_password", with: user2.password
    click_button "Sign In"

    expect(page).to_not have_css("img[src*='image.jpg']")
  end
end
