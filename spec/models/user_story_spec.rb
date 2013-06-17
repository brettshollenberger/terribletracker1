# == Schema Information
#
# Table name: user_stories
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  content      :text
#  estimate     :integer
#  project_id   :integer          not null
#  complexity   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  story_status :string(255)      default("Unstarted")
#

require 'spec_helper'

describe UserStory do
  let(:user_story) { FactoryGirl.build(:user_story) }
  let(:client)     { FactoryGirl.build(:client) }

  it "is valid" do
    expect(user_story).to be_valid
  end

  it "is invalid without a title" do
    user_story.title = nil
    expect(user_story).to_not be_valid
  end

  it "is invalid without an estimate" do
    user_story.estimate = nil
    expect(user_story).to_not be_valid
  end

  it "is invalid without content" do
    user_story.content = nil
    expect(user_story).to_not be_valid
  end

  it "is invalid without a complexity score" do
    user_story.complexity = nil
    expect(user_story).to_not be_valid
  end


end
