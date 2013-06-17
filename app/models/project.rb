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

class Project < ActiveRecord::Base
  attr_accessible :budget, :due_date, :title, :weekly_rate

  validates :title, :budget, :weekly_rate, {
    presence: true,
  }

  has_many :user_stories, {
    dependent: :destroy,
    inverse_of: :project
  }

  has_many :memberships

  accepts_nested_attributes_for :user_stories

  has_many :users, {
    through: :memberships
  }

  def client
    self.memberships.each { |membership| return membership.user if membership.role == "client" }
    return nil
  end
end
