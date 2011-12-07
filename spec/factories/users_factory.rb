# Read about factories at http://github.com/thoughtbot/factory_girl
# Factory.define :user do |user|
#   user.email                 { Factory.next(:email) }
#   user.password              { "password"   }
#   user.password_confirmation { "password"   }
# end
# 
# Factory.define :email_confirmed_user, :parent => :user do |user|
#   user.email_confirmed { true }
# end
# 
# Factory.define :topic do |topic|
#   topic.name {'topic_name'}
# end
# 
# Factory.define :interest do |interest|
#   interest.association(:topic)
#   interest.interested { |i| i.association(:user) }
# end
# 
# Factory.define :music_interest, :class => 'Interest' do |interest|
#   interest.topic { |topic| topic.association(:topic, :name => "Music") }
# end
# 
# Factory.define :sports_interest, :class => 'Interest' do |interest|
#   interest.topic { |topic| topic.association(:topic, :name => "Sports") }
# end
FactoryGirl.define do
  factory :user, :class => User do
    password "111111"
  end

  factory :volunteer, :parent => :user do
    email "volunteer@cyanglee.com"
    volunteer 1
  end

  factory :org_admin, :parent => :user do
    email "org@cyanglee.com"
    organization 1    
    
    after_create { |a| Factory(:organization_admin, :user => a) }
  end

  factory :admin, :parent => :user do
    email "admin@cyanglee.com"
    volunteer 1
    organization 1
    admin 1
  end
end

FactoryGirl.define do
  factory :organization_admin, :class => OrganizationAdmin do
    association(:user)
    association(:organization)
  end
end

FactoryGirl.define do
  factory :organization, :class => Organization do
    sequence(:name) { |i| "Org #{i}" }
    active 1
  end
end