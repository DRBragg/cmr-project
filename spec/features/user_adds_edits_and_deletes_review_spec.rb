require 'rails_helper'

feature "User does stuff with reviews", js: true do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}

  scenario "User sees review form review" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"

    page.find('a', :text => 'Review this Representative').click
    expect(page).to have_button("Submit", disabled: true)
  end

  scenario "User adds review successfully" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    page.find('a', :text => 'Review this Representative').click

    fill_in "Headline", with: "This is a headline"
    fill_in "Review", with: "I have written a review"
    select "3", :from => "Rating"

    expect(page).to have_button("Submit", disabled: false)

  end

  scenario "User add review unsuccessful" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    page.find('a', :text => 'Review this Representative').click

    fill_in "Headline", with: "This is a headline"
    fill_in "Review", with: "this"
    select "3", :from => "Rating"

    expect(page).to have_button('Submit', disabled: true)
  end
end
