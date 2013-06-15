# == Schema Information
#
# Table name: user_stories
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text
#  estimate   :integer
#  project_id :integer          not null
#  user_id    :integer          not null
#  complexity :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe UserStory do
  let(:user_story) { FactoryGirl.build(:user_story) }

  it "is valid" do
    expect(user_story).to be_valid
  end
end
