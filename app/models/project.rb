# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  budget      :integer
#  weekly_rate :integer
#  due_date    :datetime
#  client_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :budget, :client_id, :due_date, :title, :weekly_rate

  validates :title, :client, :budget, :weekly_rate, {
    presence: true,
  }

  validates :client_id, {
    numericality: true
  }

  has_many :user_stories, {
    dependent: :destroy,
    inverse_of: :project
  }

  has_and_belongs_to_many :users

  belongs_to :client, {
    class_name: "User"
  }

  accepts_nested_attributes_for :user_stories
end
