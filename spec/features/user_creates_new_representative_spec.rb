require 'rails_helper'

feature "User adds new representative", js: true, server_rendering: true do
  let!(:user1) {FactoryGirl.create(:user)}

  scenario "User visits create page" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "Add New Representative"

    expect(page).to have_content("Put a new Representative on blast!")
    expect(page).to have_button("Add Representative")
  end

  scenario "Create is successful" do
    ActionMailer::Base.deliveries = []

    visit root_path
    click_link "Sign In"

    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"

    click_on "Add New Representative"

    fill_in "First Name", with: "Bob"
    fill_in "Last Name", with: "Jones"
    fill_in "Email", with: "bob@bob.com"
    fill_in "Office", with: "Mayor of city"
    fill_in "Party Affiliation", with: "Republican"
    fill_in "Representative Bio", with: "Bob is a virgin"
    fill_in "Phone Number", with: "123-456-7890"
    fill_in "Representative Picture Link", with: "http://www.bobjones.org/AAA%20Pics%204%20Bios/Bob_1.jpg"
    click_button "Add Representative"

    expect(page).to have_content("Representative added successfully")
  end

    scenario "Create is unsuccessful" do
      visit root_path
      click_link "Sign In"

      fill_in "Email", with: user1.email
      fill_in "user_password", with: user1.password
      click_button "Sign In"

      click_on "Add New Representative"

      click_button "Add Representative"

      expect(page).to have_content("Phone number can't be blank, Phone number is invalid, First name can't be blank, Last name can't be blank, Office can't be blank, Bio can't be blank, Bio is too short (minimum is 10 characters), Picture url can't be blank, Email is invalid Put a new Representative on blast! First Name can't be blank Last Name can't be blank Email is invalid Office can't be blank Elected Party Affiliation Representative Bio can't be blank, is too short (minimum is 10 characters) Phone Number can't be blank, is invalid Representative Picure Link can't be blank")
    end
end
