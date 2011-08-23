source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'mysql2'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'

gem 'haml'
gem 'paperclip'
gem 'mime-types'
gem 'simple_form'
gem "bcrypt-ruby", :require => "bcrypt"
gem "devise"
gem "cancan"
gem 'omniauth', '~> 0.2.6'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'rspec-rails', :group => [:test, :development]
gem 'growl_notify', :group => [:test, :development]
gem 'pry', :group => [:test, :development]

group :development do
    gem 'haml-rails'
    gem 'nifty-generators'
    gem 'annotate', :git => "https://github.com/ctran/annotate_models.git"
end

group :test do
    gem 'sqlite3'
    gem 'database_cleaner'
    gem 'rails3-generators' #mainly for factory_girl & simple_form at this point
    gem 'factory_girl_rails'
    gem 'cucumber-rails'
    gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
    gem 'mocha'
    gem 'launchy'
    gem 'pickle'
    gem "guard-rspec"  
end
