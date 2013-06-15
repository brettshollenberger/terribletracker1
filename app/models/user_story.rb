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

class UserStory < ActiveRecord::Base
  attr_accessible :complexity, :content, :estimate, :project_id, :title, :user_id

  validates :title, :user, :project, {
    presence: true
  }

  validates :project_id, :user_id, {
    numericality: true
  }

  belongs_to :project
  belongs_to :user
end
