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
                :name => "Admin",
                :phone_number => "123-456-789",
                :date_of_birth => "1981-7-5",
                :zip_code => "11276",
                :volunteer => 1,
                :organization => 1
              },
              {
                :email => "volunteer@cyanglee.com",
                :password => "123456",
                :name => "Volunteer",
                :phone_number => "123-456-789",
                :date_of_birth => "1981-7-5",
                :zip_code => "11276",
                :volunteer => 1
              },
              {
                :email => "org@cyanglee.com",
                :password => "123456",
                :name => "Org",
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