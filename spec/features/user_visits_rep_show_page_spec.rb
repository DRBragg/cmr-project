require 'rails_helper'

feature "User visits a representative's show page", js: true, server_rendering: true do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
  let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}

  scenario "User is not signed in" do
    visit root_path
    click_link representative1.name

    expect(page).to_not have_content("Edit Comment")
    expect(page).to_not have_button("Delete Comment")

  end

  scenario "User is signed in" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link representative1.name

    expect(page).to have_content(representative1.first_name)
    expect(page).to have_content(representative1.last_name)
    expect(page).to have_content(representative1.office)
    expect(page).to have_content(representative1.party)
    expect(page).to have_content(representative1.email)
    expect(page).to have_content(representative1.elected)
    expect(page).to have_content(representative1.phone_number)
    expect(page).to have_xpath("//img[contains(@src, representative1.picture_url)]")
    expect(page).to have_content(representative1.bio)

    expect(page).to have_content(review1.headline)
    expect(page).to have_content(review1.body)
    expect(page).to have_content(review1.rating)

    expect(page).to have_content(comment1.body)

    expect(page).to have_content("Edit Comment")
    expect(page).to have_button("Delete Comment")
    expect(page).to have_content("Blast this rep")
    expect(page).to have_content("Comment on this blast")
  end
end
