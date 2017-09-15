require 'rails_helper'

feature "User visits a representative's show page", js: true, server_rendering: true do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}
  let!(:comment1) {FactoryGirl.create(:comment, review: review1, user: user1)}

  scenario "User views rep page" do
    visit root_path
    click_on "View Rep"

    expect(page).to have_content(representative1.first_name)
    expect(page).to have_content(representative1.last_name)
  end

  scenario "User sees more rep info" do
    visit root_path

    click_on "View Rep"

    page.find('a', :text => 'Biography').click
    page.find('a', :text => 'Contact').click


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
  end
end
