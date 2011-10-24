# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add users
User.delete_all
User.create!([
  {
    :email => "admin@cyanglee.com",
    :password => "111111",
    :first_name => "Admin",
    :last_name => "System",
    :birth_year => "1981",
    :zip_code => "11276",
    :volunteer => 1,
    :organization => 1
  },
  {
    :email => "volunteer@cyanglee.com",
    :password => "111111",
    :first_name => "Volunteer",
    :last_name => "Worker",
    :birth_year => "1981",
    :zip_code => "11276",
    :volunteer => 1
  },
  {
    :email => "org@cyanglee.com",
    :password => "111111",
    :first_name => "Org",
    :last_name => "Admin",
    :birth_year => "1981",
    :zip_code => "11276",
    :organization => 1
  }
])

# clear all the confirmation token
User.all.each do |user|
  user.update_attributes(:confirmation_token => nil, :confirmed_at => Time.now)
end

# Add organizations
Organization.delete_all
Organization.create!([
  {
    :name => "abc",
    :profile => "abc",
    :active => true
  },
  {
    :name => "cde",
    :profile => "cde",
    :active => true
  },
  {
    :name => "fff",
    :profile => "fff",
    :active => true
  }
])