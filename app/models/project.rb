class Project < ActiveRecord::Base
  attr_accessible :budget, :client_id, :due_date, :title, :weekly_rate

  validates :title, :client, :client_id, {
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

  belongs_to :client
end
