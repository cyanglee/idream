FactoryGirl.define do
	factory :volunteer_role, :class => Role do
    	name 'Volunteer'
	end
	factory :organization_role, :class => Role do
    	name 'Organization'
	end

	factory :admin_role, :class => Role do
    name 'Admin'
	end
end