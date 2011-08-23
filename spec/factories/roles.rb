# Read about factories at http://github.com/thoughtbot/factory_girl

#Factory.define :role do |f|
#    f.name :name
#    f.association :user
#end

#Factory.define :article do |m|
#  m.sequence(:title) {|i| "Article #{i}" }
#  m.association :author, :factory => :user
#end
#

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