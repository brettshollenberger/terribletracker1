class Membership < ActiveRecord::Base
  attr_accessible :project_id, :role, :user_id

  validates :user, :project, :role, {
    presence: true
  }
end
