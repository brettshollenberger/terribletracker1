require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "add user stories to projects" do

  background do
    admin = FactoryGirl.create(:admin)
    project = FactoryGirl.create(:project)
    login_as(admin, :scope => :admin)
    visit projects_path
  end

  scenario "creating as an admin" do
    click_link "Turrible Tracka"
    click_link "Add User Stories"
    fill_in_with_valid_attributes(admin)
    expect(page).to have_content("Add user stories to project")
  end

  def fill_in_with_valid_attributes(developer)
    fill_in "Title", with: "Add user stories to project"
    fill_in "Content", with: "As a developer,\
    I want to add user stories to a project, so that I can\
    add to the project scope"
    fill_in "Complexity", with: "1"
    fill_in "Estimate", with: "1"
    fill_in "Developer", with: "#{developer.email}"
    click_button "Create User story"
  end

end


