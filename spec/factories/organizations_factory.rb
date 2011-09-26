FactoryGirl.define do
  factory :organizations, :class => Organization do
    sequence(:name) { |i| "Org #{i}" }
    active 1
  end
end