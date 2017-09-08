require 'rails_helper'

feature "User adds new representative" do
  let!(:user1) {FactoryGirl.create(:user)}

  scenario "User visits create page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link "Put a new representative on blast!"

    expect(page).to have_content("Put a new Representative on blast!")
    expect(page).to have_button("Add Representative")
  end

  scenario "Create is successful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link "Put a new representative on blast!"

    fill_in "First name", with: "Bob"
    fill_in "Last name", with: "Jones"
    fill_in "Email", with: "bob@bob.com"
    fill_in "Office", with: "Mayor of city"
    fill_in "Party", with: "Republican"
    fill_in "Elected", with: Date.today
    fill_in "Bio", with: "Bob is a virgin"
    fill_in "Phone number", with: "123-456-7890"
    fill_in "Picture url", with: "http://www.bobjones.org/AAA%20Pics%204%20Bios/Bob_1.jpg"

    click_button "Add Representative"

    expect(page).to have_content("Representative added successfully")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

    scenario "Create is unsuccessful" do
      visit root_path
      click_link "Sign In"
      fill_in "Email", with: user1.email
      fill_in "user_password", with: user1.password
      click_button "Sign In"
      click_link "Put a new representative on blast!"

      click_button "Add Representative"

      expect(page).to have_content("Phone number can't be blank, Phone number is invalid, First name can't be blank, Last name can't be blank, Office can't be blank, Bio can't be blank, Bio is too short (minimum is 10 characters), Elected can't be blank, Picture url can't be blank, Email is invalid")
    end
end
