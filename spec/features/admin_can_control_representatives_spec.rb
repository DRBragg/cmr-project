# require 'rails_helper'
#
# feature "Admin lords over representatives", js: true, server_rendering: true do
#   let!(:admin) {FactoryGirl.create(:user, admin: true)}
#   let!(:user1) {FactoryGirl.create(:user)}
#   let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
#   let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
#   let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}
#
#   scenario "Admin can see edit and delete from index" do
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: admin.email
#     fill_in "user_password", with: admin.password
#     click_button "Sign In"
#
#     expect(page).to have_link(representative1.name)
#     expect(page).to have_link("Edit Representative")
#     expect(page).to have_button("Delete Representative")
#   end
#
#   scenario "Admin can edit representatives" do
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: admin.email
#     fill_in "user_password", with: admin.password
#     click_button "Sign In"
#     click_link "Edit Representative"
#
#     expect(page).to have_content("Edit Representative")
#   end
#
#   scenario "Admin successfully edits representative" do
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: admin.email
#     fill_in "user_password", with: admin.password
#     click_button "Sign In"
#     click_link "Edit Representative"
#     click_button "Update Representative"
#
#     expect(page).to have_content("Representative updated successfully")
#   end
#
#   scenario "Admin unsuccessfully edits representative" do
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: admin.email
#     fill_in "user_password", with: admin.password
#     click_button "Sign In"
#     click_link "Edit Representative"
#     fill_in "First name", with: ""
#
#     click_button "Update Representative"
#     expect(page).to have_content("First name can't be blank")
#   end
#
#   scenario "Admin can delete representatives" do
#     visit root_path
#     click_link "Sign In"
#     fill_in "Email", with: admin.email
#     fill_in "user_password", with: admin.password
#     click_button "Sign In"
#     click_button "Delete Representative"
#
#     expect(page).to_not have_link(representative1.name)
#   end
# end
