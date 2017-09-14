require 'rails_helper'

feature "User does stuff with comments", js: true, server_rendering: true do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
  let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}

  scenario "User shows add comment form" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Add a Comment!"

    expect(page).to have_button("Submit", disabled: true)
  end

  scenario "User adds comment successfully" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Add a Comment!"

    fill_in "Comment", with: "TESTCOMMENT!"

    expect(page).to have_button("Submit", disabled: false)
  end

  scenario "User add comment unsuccessful" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Add a Comment!"

    expect(page).to have_button("Submit", disabled: true)

    fill_in "Comment", with: "no"

    expect(page).to have_button("Submit", disabled: true)
  end
end
