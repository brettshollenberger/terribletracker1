require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "deleting projects" do

  background do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    project = FactoryGirl.create(:project)
    visit projects_path
    click_link "Delete"
  end

  scenario "viewing as an admin" do
    expect(page).to have_content("Project deleted")
  end

end
