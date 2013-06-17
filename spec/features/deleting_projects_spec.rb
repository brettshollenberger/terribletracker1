require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "deleting projects" do

  after { Warden.test_reset! }

  background do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    project = FactoryGirl.create(:project)
    visit projects_path
    click_link "Delete"
  end

  scenario "viewing as a user" do
    expect(page).to have_content("Project deleted")
  end

end
