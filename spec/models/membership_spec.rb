# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  project_id :integer          not null
#  role       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Membership do
  let(:membership) { FactoryGirl.create(:owner) }
  let(:owner) { FactoryGirl.create(:owner) }
  let(:collaborator) { FactoryGirl.create(:collaborator) }
  let(:client) { FactoryGirl.create(:client) }

  it "is valid" do
    expect(owner).to be_valid
    expect(collaborator).to be_valid
    expect(client).to be_valid
  end

  it "is not valid without a project" do
    membership.project = nil
    expect(membership).to_not be_valid
  end

  it "is not valid without a user" do
    membership.user = nil
    expect(membership).to_not be_valid
  end

  it "is not valid without a role" do
    membership.role = nil
    expect(membership).to_not be_valid
  end
end
