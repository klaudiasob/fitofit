# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'factory_bot_rails'
gem 'geocoder'
gem 'groupdate'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'ffaker'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'rails-controller-testing'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
