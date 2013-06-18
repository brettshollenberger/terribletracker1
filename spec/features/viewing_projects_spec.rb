require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "viewing projects" do

  after { Warden.test_reset! }

  background do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    project = FactoryGirl.create(:project)
    membership = Membership.create(project: project, user: user, role: "collaborator")
    visit projects_path
  end

  scenario "viewing as a user" do
    expect(page).to have_content("Projects")
    expect(page).to have_content("Turrible Tracka")
    expect(page).to have_content("2000")
  end

end
