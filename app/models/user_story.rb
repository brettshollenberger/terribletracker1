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

class UserStory < ActiveRecord::Base
  attr_accessible  :story_status, :complexity, :content, :estimate, :project_id, :title

  validates :title, :project, :content, :estimate, :complexity, :story_status, {
    presence: true
  }

  validates :project_id, {
    numericality: true
  }

  belongs_to :project

  has_many :story_owners

  has_many :users, {
    through: :story_owners
  }
end
