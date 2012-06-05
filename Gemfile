source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'

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
gem 'mime-types'
gem 'simple_form'
gem "bcrypt-ruby", :require => "bcrypt"
gem "devise", :git => 'git://github.com/plataformatec/devise.git'
gem "cancan"
gem "omniauth"
gem "omniauth-facebook"
#gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'settingslogic', :git => 'git://github.com/binarylogic/settingslogic.git'
gem 'rails-i18n'
gem 'heroku'
gem 'newrelic_rpm'

# Use unicorn as the web server
#gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :production do
  gem 'execjs'
  gem 'therubyracer'
  gem 'pg'
end

group :development, :test do
  # gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rspec-rails'
  # gem 'growl'
  # gem 'growl_notify'
  gem 'pry'
  gem 'faker'
  gem 'awesome_print'
end

group :development do
  gem 'haml-rails'
  gem 'nifty-generators'
  gem 'annotate', :git => "https://github.com/ctran/annotate_models.git"
  gem 'hirb'
  gem 'taps'
end

group :test do
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'rails3-generators' #mainly for factory_girl & simple_form at this point
  gem 'factory_girl_rails'
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'mocha'
  gem 'launchy'
  # gem 'pickle'
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem 'simplecov', :require => false
end
