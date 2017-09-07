require 'rails_helper'

feature "User does stuff with comments" do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
  let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}

  scenario "User visits add comment" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Comment on this blast"

    expect(page).to have_content("Comment on this blast!")
    expect(page).to have_button("Add Comment")

  end

  scenario "User adds comment successfully" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Comment on this blast"
    fill_in "Body", with: "TESTCOMMENT!"
    click_button "Add Comment"

    expect(page).to have_content("Comment added successfully")
    expect(page).to have_content("TESTCOMMENT!")

  end

  scenario "User add comment unsuccessful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Comment on this blast"
    click_button "Add Comment"

    expect(page).to have_content("Body can't be blank")
  end

  scenario "User visits comment edit" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Edit Comment"

    expect(page).to have_content("Edit this comment")
    expect(page).to have_content(comment1.body)
    expect(page).to have_button("Update Comment")
  end

  scenario "User edit comment successful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Edit Comment"

    fill_in "Body", with: "EDITED!"
    click_button "Update Comment"

    expect(page).to have_content("Comment updated successfully")
    expect(page).to have_content("EDITED!")
  end

  scenario "User deletes comment" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_button "Delete Comment"

    expect(page).to_not have_content(comment1.body)

  end


end
