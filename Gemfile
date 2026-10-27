source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '~> 6.1.7'
gem 'ffi', '1.14.2'

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'
gem 'web-console', '~> 4'
gem 'faraday', '1.8.0'  # in main group; simplifies calling TMDb
gem 'json', '~> 2.7' # Sprockets 3 passes a removed JSON parser option

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.7'
end

group :production do
  gem 'pg', '~> 1.1'
  gem 'rails_12factor'
end

group :test do
  gem 'rails-controller-testing'
  gem 'webmock'
  gem 'guard-rspec'                 # automates re-running tests
end

