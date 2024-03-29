# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  budget      :integer
#  weekly_rate :integer
#  due_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.build(:project) }

  it "is valid" do
    expect(project).to be_valid
  end

  it "is invalid without a title" do
    project.title = nil
    expect(project).to_not be_valid
  end

  it "is invalid without a budget" do
    project.budget = nil
    expect(project).to_not be_valid
  end

  it "is invalid without a weekly_rate" do
    project.weekly_rate = nil
    expect(project).to_not be_valid
  end
end
