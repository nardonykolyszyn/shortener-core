# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.8'
  gem 'factory_bot_rails', '~> 6.0'
  gem 'faker', '~> 2.13', require: false
  gem 'rspec-collection_matchers', '~> 1.2'
  gem 'rspec-its', '~> 1.3'
  gem 'rspec-json_expectations', '~> 2.2'
  gem 'rspec-rails', '~> 4.0'
  gem 'simplecov', '~> 0.18.5'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.8'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Deployment dependencies
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
  gem 'sshkit-sudo', '~> 0.1.0'
end

gem 'fast_jsonapi', '~> 1.5'

gem 'pagy', '~> 3.8'

gem "rack-cors", "~> 1.1"
gem 'rollbar', '~> 2.26'

gem "figaro", "~> 1.2"
