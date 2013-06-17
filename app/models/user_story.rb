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
#  developer_id :integer          not null
#

class UserStory < ActiveRecord::Base
  attr_accessible  :story_status, :complexity, :content, :estimate, :project_id, :title, :developer_id

  validates :title, :developer, :project, :content, :estimate, :complexity, :story_status, {
    presence: true
  }

  validates :project_id, :developer_id, {
    numericality: true
  }

  belongs_to :project
  belongs_to :developer, {
    class_name: "User"
  }
end
