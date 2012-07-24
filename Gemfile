source 'https://rubygems.org'

# Specifying the ruby version for Heroku
ruby '1.9.3'

gem 'rails', '3.2.6'

gem 'heroku'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'geocoder'
gem 'hirb'

# Twilio gems
gem 'twilio-ruby'
gem 'trails'
gem 'twilio-rb'
# Annotate gem.
gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'

# Gems needed for Ampletrails
gem 'mechanize'
gem 'nokogiri'

# Thin server instead of the standard Webrick on the production server
group :production do
  gem 'thin'
end

# Tropo gem
#gem 'tropo-webapi-ruby'

# Nexmo
#gem 'nexmo'

# Gems required for Exotel 
gem 'typhoeus'

# Authentication
gem "devise"

gem 'factory_girl_rails'

group :development do 
	gem 'rspec'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-livereload'
  gem 'guard-annotate'
  gem 'guard-bundler'
  gem 'rspec-rails'
end

group :test do
	gem 'rspec'
  # The require false needs to be there otherwise spork will be throwing an error
	gem "cucumber-rails", require: false
  gem 'guard-cucumber'
	gem 'sqlite3'
	gem 'database_cleaner'
  gem 'capybara'
  gem 'guard-livereload'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'guard-spork'
  gem 'spork'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Testing gems 

gem "email_spec", :group => :test
gem "capybara", :group => :test
gem "launchy", :group => :test
gem 'factory_girl_rails', :group => :test