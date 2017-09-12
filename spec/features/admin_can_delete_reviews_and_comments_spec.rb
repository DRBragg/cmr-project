require 'rails_helper'

feature "Admin can destroy reviews and comments", js: true, server_rendering: true do
  let!(:admin) {FactoryGirl.create(:user, admin: true)}
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
  let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}

  scenario "Admin can delete review" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "user_password", with: admin.password
    click_button "Sign In"
    click_link representative1.name
    click_button "Delete Review"

    expect(page).to_not have_content(review1.headline)
  end

  scenario "Admin can delete comment" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: admin.email
    fill_in "user_password", with: admin.password
    click_button "Sign In"
    click_link representative1.name
    click_button "Delete Comment"

    expect(page).to_not have_content(comment1.body)
  end
end
