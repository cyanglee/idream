# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :volunteer, :class => User do
    sequence(:email) { |n| "foo#{n}@example.com" }
    sequence(:username) { |n| "foo#{n}" }
    sequence(:first_name) { |n| "volunteer#{n}" }
    sequence(:last_name) { |n| "worker#{n}" }
    password "111111"
    volunteer 1
  end

  factory :org_admin, :class => User do
    sequence(:email) { |n| "foo#{n}@example.com" }
    sequence(:username) { |n| "foo#{n}" }
    sequence(:first_name) { |n| "org#{n}" }
    sequence(:last_name) { |n| "admin#{n}" }
    password "111111"
    organization 1
  end

  factory :admin, :class => User do
    sequence(:email) { |n| "foo#{n}@example.com" }
    sequence(:username) { |n| "foo#{n}" }
    sequence(:first_name) { |n| "admin#{n}" }
    sequence(:last_name) { |n| "system#{n}" }
    password "111111"
    volunteer 1
    organization 1
    admin 1
  end
end