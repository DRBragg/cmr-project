require 'rails_helper'

feature "User visits home page", js: true do
  let!(:user1) {FactoryGirl.create(:user)}
  let!(:representative1) {FactoryGirl.create(:representative)}
  scenario "User sees Representatives" do
    visit root_path

    expect(page).to have_content(representative1.name)
  end
end
