source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.6"
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'ransack'
gem 'kaminari'
gem 'bootstrap', '~> 5.3.2'
gem 'sass-rails', '>= 3.2'
gem 'jquery-rails'

gem 'bcrypt', '~> 3.1.7'


group :development, :test do
  gem 'faker'
  gem "byebug"
  gem 'rspec-rails', '~> 6.1.0'
  gem 'factory_bot_rails'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rails-controller-testing'
end

group :development do
  gem "web-console"
end

group :test do
  gem 'capybara', '~> 3.28'
  gem 'selenium-webdriver', '~> 4.8'
end
