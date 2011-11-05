namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
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
    # create fake volunteers and school admins
    30.times do |n|
      name = Faker::Name.name
      email = "vol-#{n+1}@cyanglee.com"
      password = "password"
      User.create!(:first_name => name,
                   :email => email,
                   :volunteer => 1,
                   :password => password,
                   :password_confirmation => password)
      email = "org-#{n+1}@cyanglee.com"
      User.create!(:first_name => Faker::Name.name,
                   :email => email,
                   :organization => 1,
                   :password => password,
                   :password_confirmation => password)
    end

    # clear all the confirmation token
    User.all.each do |user|
      user.update_attributes(:confirmation_token => nil, :confirmed_at => Time.now)
    end
  end
end