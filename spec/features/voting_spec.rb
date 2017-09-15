# require 'rails_helper'
#
# feature "User can upvote or downvote a review", js: true, server_rendering: true do
#   let!(:user1) {FactoryGirl.create(:user)}
#   let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
#   let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
#   let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}
#
#   scenario "User upvotes a review" do
#     visit root_path
#     click_link "Sign In"
#
#     fill_in "Email", with: user1.email
#     fill_in "user_password", with: user1.password
#     click_button "Sign In"
#
#     click_on "View Rep"
#
#     expect(page).to have_button("Upvote")
#   end
#
#   scenario "User downvotes a review" do
#     visit root_path
#     click_link "Sign In"
#
#     fill_in "Email", with: user1.email
#     fill_in "user_password", with: user1.password
#     click_button "Sign In"
#
#     click_on "View Rep"
#
#     expect(page).to have_button("Downvote")
#   end
#
#   scenario "User tries to upvote a review they have previously upvoted" do
#     visit root_path
#     click_link "Sign In"
#
#     fill_in "Email", with: user1.email
#     fill_in "user_password", with: user1.password
#     click_button "Sign In"
#
#     click_on "View Rep"
#
#     expect(page).to have_button("Upvote")
#   end
#
#   scenario "User tries to downvote a review they have previously downvoted" do
#     visit root_path
#     click_link "Sign In"
#
#     fill_in "Email", with: user1.email
#     fill_in "user_password", with: user1.password
#     click_button "Sign In"
#
#     click_on "View Rep"
#
#     expect(page).to have_button("Downvote")
#   end
#
#   scenario "Visitor tries to upvote when not logged in" do
#     visit root_path
#     click_link "Sign In"
#
#     fill_in "Email", with: user1.email
#     fill_in "user_password", with: user1.password
#     click_button "Sign In"
#
#     click_on "View Rep"
#
#     expect(page).to have_button("Upvote")
#   end
#
#   scenario "Visitor tries to downvote when not logged in" do
#     visit root_path
#     click_link "Sign In"
#
#     fill_in "Email", with: user1.email
#     fill_in "user_password", with: user1.password
#     click_button "Sign In"
#
#     click_on "View Rep"
#
#     expect(page).to have_button("Downvote")
#   end
#
# end
