require 'rails_helper'

feature "User does stuff with reviews" do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}

  scenario "User visits add review" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Blast this rep"

    expect(page).to have_content("Blast your Rep!")
    expect(page).to have_button("Add Review")

  end

  scenario "User adds review successfully" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Blast this rep"
    fill_in "Headline", with: "This dude totally sucks ass"
    fill_in "Body", with: "I literally hate this guy the most of anyone ever forever!"
    fill_in "Rating", with: "1"
    click_button "Add Review"

    expect(page).to have_content("Review added successfully")
    expect(page).to have_content("This dude totally sucks ass")

  end

  scenario "User add review unsuccessful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Blast this rep"
    click_button "Add Review"

    expect(page).to have_content("Headline can't be blank , Body can't be blank , Body is too short (minimum is 10 characters) , Rating is not a number , Rating can't be blank , Rating is not included in the list")

  end

  scenario "User visits review edit" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Edit Review"

    expect(page).to have_content("Edit this review")
    expect(find_field('Body').value).to eq review1.body
    expect(page).to have_button("Update Review")
  end

  scenario "User edit review successful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Edit Review"

    fill_in "Body", with: "EDITED REVIEW THAT MEETS THE REQUIREMENTS!"
    click_button "Update Review"

    expect(page).to have_content("Review updated successfully")
    expect(page).to have_content("EDITED REVIEW THAT MEETS THE REQUIREMENTS!")
  end

  scenario "User edit review unsuccessful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_link "Edit Review"

    fill_in "Body", with: ""
    click_button "Update Review"

    expect(page).to have_content("Body can't be blank , Body is too short (minimum is 10 characters)")
  end

  scenario "User deletes review" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name
    click_button "Delete Review"

    expect(page).to_not have_content(review1.body)

  end


end
