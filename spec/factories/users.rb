# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
	factory :volunteer, :class => User  do
		sequence(:email) { |n| "foo#{n}@example.com" }
    	password "123456"
    	volunteer 1
    end

    factory :org_rep, :class => User  do
		sequence(:email) { |n| "foo#{n}@example.com" }
    	password "123456"
    	organization 1
    end

    factory :admin, :class => User  do
		sequence(:email) { |n| "foo#{n}@example.com" }
    	password "123456"
    	volunteer 1
    	organization 1
    	admin 1
    end
end