FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "yoda#{n}@dagobah.com" }
    password "foobar29"
  end

  factory :user_story do
    title "Add reviews"
    content "As a user, I want to review a movie, so my voice can be heard."
    estimate ".5"
    complexity "1"
    project
  end

  factory :project do
    sequence(:title) { |n| "Turrible Tracka #{n}" }
    budget "1000000"
    weekly_rate "2000"
    due_date = Time.now
  end

  factory :membership do
    user
    project

    trait :owner do
      role "owner"
    end

    trait :collaborator do
      role "collaborator"
    end

    trait :client do
      role "client"
    end

    factory :owner, traits: [:owner]
    factory :collaborator, traits: [:collaborator]
    factory :client, traits: [:client]
  end

  factory :story_owner do
    user
    user_story
  end
end
