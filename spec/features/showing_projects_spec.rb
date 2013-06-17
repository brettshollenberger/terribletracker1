require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "showing projects" do

  after { Warden.test_reset! }

  background do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    project = FactoryGirl.create(:project)
    visit project_path(project)
  end

  scenario "viewing as a user" do
    expect(page).to have_content("Turrible Tracka")
  end

end
