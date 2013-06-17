# == Schema Information
#
# Table name: story_owners
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  user_story_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe StoryOwner do

  let(:story_owner) { FactoryGirl.create(:story_owner) }

  it "is valid" do
    expect(story_owner).to be_valid
  end

  it "is invalid without a user" do
    story_owner.user = nil
    expect(story_owner).to_not be_valid
  end

  it "is invalid without a user story" do
    story_owner.user_story = nil
    expect(story_owner).to_not be_valid
  end

end
