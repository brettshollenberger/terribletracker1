require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "editing projects" do

  after { Warden.test_reset! }

  background do
    @project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)
    membership = Membership.create(project: @project, user: user, role: "collaborator")
    login_as(user, :scope => :user)
    visit projects_path
  end

  scenario "editing as an user" do
    click_link "Edit"
    fill_in_valid_attributes
    click_button "Update Project"
    expect(page).to have_content("Smooth Jazz")
  end

end

def fill_in_valid_attributes
  fill_in "Title", with: "Smooth Jazz"
  fill_in "Budget", with: 1
  fill_in "Weekly rate", with: 1
end
