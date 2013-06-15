require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "showing projects" do

  background do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    project = FactoryGirl.create(:project)
    visit project_path(project)
  end

  scenario "viewing as an admin" do
    expect(page).to have_content("Terrible Tracker")
  end

end
