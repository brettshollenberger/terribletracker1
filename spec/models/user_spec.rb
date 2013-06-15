# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  role                   :string(255)      default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'spec_helper'

describe User do
  let(:developer) { FactoryGirl.build(:developer) }
  let(:admin)     { FactoryGirl.build(:admin) }
  let(:client)    { FactoryGirl.build(:client) }

  it "is valid" do
    expect(developer).to be_valid
    expect(admin).to be_valid
    expect(client).to be_valid
  end

end
