require 'rails_helper'



feature "User uses OnBlast's formative Search functionality", js: true, server_rendering: true do

  let!(:representative1) {FactoryGirl.create(:representative)}
  let!(:representative2) {FactoryGirl.create(:representative, office: "garbageman")}

  scenario "User Searches for representative by first name" do
    visit root_path
    fill_in "Search Representatives", with: representative1.first_name
    click_button "Search"

    expect(page).to have_link(representative1.name)
    expect(page).to_not have_link(representative2.name)
  end

  scenario "User Searches for representative by last name" do
      visit root_path
      fill_in "Search Representatives", with: representative1.last_name
      click_button "Search"

      expect(page).to have_link(representative1.name)
      expect(page).to_not have_link(representative2.name)
    end

  scenario "User Searches for representative by office" do
      visit root_path
      fill_in "Search Representatives", with: representative1.office
      click_button "Search"

      expect(page).to have_link(representative1.name)
      expect(page).to_not have_link(representative2.name)
    end

  scenario "User Searches for representative that doesn't exist" do
    visit root_path
    fill_in "Search Representatives", with: "clearlynotawinner"
    click_button "Search"

    expect(page).to have_content("There are no representatives containing clearlynotawinner.")
  end
end
