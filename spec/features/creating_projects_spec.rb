require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "creating projects" do

  before { Warden.test_reset! }

  background do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit projects_path
  end

  scenario "creating as a user" do
    click_link "New Project"
    fill_in_with_valid_attributes
    click_button "Create Project"
    expect(page).to have_content("Turrible Tracka")
  end

end

def fill_in_with_valid_attributes
  fill_in "Title", with: "Turrible Tracka"
  fill_in "Budget", with: 1
  fill_in "Weekly rate", with: 1
end
