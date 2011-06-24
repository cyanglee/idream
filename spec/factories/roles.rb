# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :volunteer, :class => Role do |f|
    f.name 'Volunteer'
end

Factory.define :organization, :class => Role do |f|
    f.name 'Organization'
end

Factory.define :admin, :class => Role do |f|
    f.name 'Admin'
end