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
                  :date_of_birth => "1981-7-5",
                  :zip_code => "11276"
              },
              {
                  :email => "volunteer@cyanglee.com",
                  :password => "123456",
                  :first_name => "Volunteer",
                  :last_name => "Lee",
                  :phone_number => "123-456-789",
                  :date_of_birth => "1981-7-5",
                  :zip_code => "11276",
                  :volunteer => 1
              },
              {
                  :email => "org@cyanglee.com",
                  :password => "123456",
                  :first_name => "Org",
                  :last_name => "Lee",
                  :phone_number => "123-456-789",
                  :date_of_birth => "1981-7-5",
                  :zip_code => "11276",
                  :organization => 1
              }
             ])

# Add organizations
Organization.delete_all
Organization.create!([{
                          :name => "abc",
                          :profile => "abc"
                      },
                      {
                          :name => "cde",
                          :profile => "cde"
                      },
                      {
                          :name => "fff",
                          :profile => "fff"
                      }
                     ]
)

# Add roles
Role.delete_all
["Volunteer", "Organization", "Admin"].each do |role_name|
    Role.find_or_create_by_name role_name
end