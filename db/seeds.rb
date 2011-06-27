# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add users
User.delete_all
User.create!([{
                  :email => "admin@cyanglee.com",
                  :password => "123456",
                  :first_name => "Admin",
                  :last_name => "Lee",
                  :phone_number => "123-456-789",
                  :birth_day => 5,
                  :birth_month => 7,
                  :birth_year => 1981,
                  :zip_code => "11276"
              },
              {
                  :email => "volunteer@cyanglee.com",
                  :password => "123456",
                  :first_name => "Volunteer",
                  :last_name => "Lee",
                  :phone_number => "123-456-789",
                  :birth_day => 5,
                  :birth_month => 7,
                  :birth_year => 1981,
                  :zip_code => "11276",
                  :volunteer => 1
              },
              {
                  :email => "org@cyanglee.com",
                  :password => "123456",
                  :first_name => "Org",
                  :last_name => "Lee",
                  :phone_number => "123-456-789",
                  :birth_day => 5,
                  :birth_month => 7,
                  :birth_year => 1981,
                  :zip_code => "11276",
                  :org => 1
              }
             ])


# Add roles
Role.delete_all
["Volunteer", "Organization", "Admin"].each do |role_name|
    Role.find_or_create_by_name role_name
end