require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "viewing projects" do

  background do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    project = FactoryGirl.create(:project)
    visit projects_path
  end

  scenario "viewing as an admin" do
    expect(page).to have_content("Projects")
    expect(page).to have_content("Terrible Tracker")
  end

end
