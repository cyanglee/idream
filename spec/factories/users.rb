# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
	factory :volunteer, :class => User  do
		sequence(:email) { |n| "foo#{n}@example.com" }
        name "volunteer"
    	password "123456"
    	volunteer 1
    end

    factory :org_admin, :class => User  do
		sequence(:email) { |n| "foo#{n}@example.com" }
        name "org_admin"
    	password "123456"
    	organization 1
    end

    factory :admin, :class => User  do
		sequence(:email) { |n| "foo#{n}@example.com" }
        name "admin"
    	password "123456"
    	volunteer 1
    	organization 1
    	admin 1
    end
end