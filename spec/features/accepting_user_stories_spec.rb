require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "accepting user stories" do

  before { Warden.test_reset! }

  background do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    user_story = FactoryGirl.create(:user_story)
    membership = Membership.create(project: user_story.project, user: @user, role: "collaborator")
    visit project_path(user_story.project)
  end

  scenario "project not yet accepted" do
    expect(page).to have_button("No one assigned")
    click_button "No one assigned"
    expect(page).to have_content(@user.email)
  end

end
