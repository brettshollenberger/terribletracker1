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

class Membership < ActiveRecord::Base
  attr_accessible :project_id, :role, :user_id

  validates :role, :project, :user, {
    presence: true
  }

  belongs_to :user
  belongs_to :project
end
