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

Factory.define :volunteer, :class => Role do |f|
    f.name 'Volunteer'
#    f.association :user
end

Factory.define :organization, :class => Role do |f|
    f.name 'Organization'
end

Factory.define :admin, :class => Role do |f|
    f.name 'Admin'
end