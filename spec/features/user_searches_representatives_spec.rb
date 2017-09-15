require 'rails_helper'

feature "User uses OnBlast's formative Search functionality", js: true, server_rendering: true do

  let!(:representative1) {FactoryGirl.create(:representative)}
  let!(:representative2) {FactoryGirl.create(:representative, office: "garbageman")}

  scenario "User Searches for representative by first name" do
    visit root_path
    fill_in "Search", with: representative1.first_name
    click_on "Submit"

    expect(page).to have_content(representative1.name)
    expect(page).to_not have_content(representative2.name)
  end

  scenario "User Searches for representative by last name" do
      visit root_path
      fill_in "Search", with: representative1.last_name
      click_on "Submit"

      expect(page).to have_content(representative1.name)
      expect(page).to_not have_content(representative2.name)
    end

  scenario "User Searches for representative by office" do
      visit root_path
      fill_in "Search", with: representative1.office
      click_on "Submit"

      expect(page).to have_content(representative1.name)
      expect(page).to_not have_content(representative2.name)
    end

  scenario "User Searches for representative that doesn't exist" do
    visit root_path
    fill_in "Search", with: "clearlynotawinner"
    click_on "Submit"

    expect(page).to_not have_content(representative1.name)
    expect(page).to_not have_content(representative2.name)
    expect(page).to have_content("There are no representatives matching your search")
  end
end
