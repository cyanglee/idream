FactoryGirl.define do
	factory :organizations, :class => Organization do
    	sequence(:name) {|i| "Org #{i}" }
	end
end