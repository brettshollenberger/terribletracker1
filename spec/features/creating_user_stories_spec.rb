require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "add user stories to projects" do

  after { Warden.test_reset! }

  background do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project)
    login_as(user, :scope => :user)
    visit projects_path
  end

  scenario "creating as a user" do
    click_link "Turrible Tracka"
    click_link "Add User Stories"
    fill_in_with_valid_attributes
    expect(page).to have_content("Add user stories to project")
  end

  def fill_in_with_valid_attributes
    fill_in "Title", with: "Add user stories to project"
    fill_in "Content", with: "As a developer,\
    I want to add user stories to a project, so that I can\
    add to the project scope"
    fill_in "Complexity", with: "1"
    fill_in "Estimate", with: "1"
    click_button "Create User story"
  end

end


