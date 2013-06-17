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

class StoryOwner < ActiveRecord::Base
  attr_accessible :user_id, :user_story_id

  belongs_to :user
  belongs_to :user_story

  validates :user, :user_story, {
    presence: true
  }
end
