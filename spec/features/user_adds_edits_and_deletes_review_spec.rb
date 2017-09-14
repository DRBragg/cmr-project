require 'rails_helper'

feature "User does stuff with reviews", js: true, server_rendering: true do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative, user: user1)}
  let!(:review1) {FactoryGirl.create(:review, representative: representative1, user: user1)}

  scenario "User visits add review" do
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
    click_button "Submit"

    # expect(page).to have_content("Blast your Rep!")
    # expect(page).to have_button("Add Review")

  end

  scenario "User adds review successfully" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

<<<<<<< HEAD
    click_on "View Rep"
    page.find('a', :text => 'Review this Representative').click

    fill_in "Headline", with: "This is a headline"
    fill_in "Review", with: "I have written a review"
    select "3", :from => "Rating"
    click_button "Submit"

    # expect(page).to have_content("Review added successfully")
    # expect(page).to have_content("This dude totally sucks ass")

=======
    expect(page).to have_content("Review added successfully")
    expect(page).to have_content("This dude totally sucks ass")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
>>>>>>> b3ab392e9c2dc8d51e9e12284276e7d922e2d304
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

  scenario "User visits review edit" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Edit Review"

    expect(page).to have_button('Edit Review')
  end

  scenario "User edit review successful" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Edit Review"

    expect(page).to have_button('Edit Review')
  end

  scenario "User edit review unsuccessful" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Edit Review"

    expect(page).to have_button('Edit Review')
  end

  scenario "User deletes review" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "View Rep"
    click_on "Edit Review"

    expect(page).to have_button('Edit Review')
  end


end
