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

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "yoda#{n}@dagobah.com" }
    password "foobar29"

    trait :developer do
      role "developer"
    end

    trait :admin do
      role "admin"
    end

    trait :client do
      role "client"
    end

    factory :developer, traits: [:developer]
    factory :admin, traits: [:admin]
    factory :client, traits: [:client]
  end

  factory :user_story do
    title "Add reviews"
    content "As a user, I want to review a movie, so my voice can be heard."
    estimate ".5"
    complexity "1"
    project
    developer
  end

  factory :project do
    title "Terrible Tracker"
    budget "1000000"
    weekly_rate "2000"
    due_date = Time.now
    client
  end
end
