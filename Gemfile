# frozen_string_literal: true

source 'https://rubygems.org'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'devise', '~> 4.9'
gem 'image_processing', '~> 1.2'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'kamal', require: false
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.1.1'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'slim-rails'
gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'
gem 'stimulus-rails'
gem 'thruster', require: false
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'dotenv-rails'
  gem 'faker'
  gem 'minitest-power_assert'
  gem 'rubocop-rails-omakase', require: false
  gem 'slim_lint'
  gem 'sqlite3', '>= 2.1'
end

group :development do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rubocop-capybara'
  gem 'selenium-webdriver'
end
