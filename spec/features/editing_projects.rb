require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "editing projects" do

  background do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    visit projects_path
  end

  scenario "editing as an admin" do
    click_link "Edit"
    fill_in_valid_attributes
    expect(page).to have_content("Smooth Jazz")
    expect(page).to_not have_content("Terrible Tracker")
  end

end

def fill_in_valid_attributes
  client = FactoryGirl.create(:client)
  fill_in "Title", with: "Smooth Jazz"
  fill_in "Client", with: client.email
  fill_in "Budget", with: 1
  fill_in "Weekly rate", with: 1
  click_button "Update Project"
end
