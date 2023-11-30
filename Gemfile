# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.2"

gem "awesome_print", "~> 1.9.2"
gem "bootsnap", "~> 1.17.0", require: false
gem "hotwire-rails", "~> 0.1.3"
gem "importmap-rails", "~> 1.2.3"
gem "jbuilder", "~> 2.11.5"
gem "phlex-rails", "~> 1.1.1"
gem "puma", "~> 6.4.0"
gem "redis", "~> 5.0.8"
gem "requestjs-rails", "~> 0.0.11"
gem "sidekiq", "~> 7.2.0"
gem "sprockets-rails", "~> 3.4.2"
gem "sqlite3", "~> 1.6.9"
gem "stimulus-rails", "~> 1.3.0"
gem "tailwindcss-rails", "~> 2.0.32"
gem "turbo-rails", "~> 2.0.0.pre.beta.1"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development do
  gem "annotate", "~> 3.2.0", require: false
  gem "guard-livereload", "~> 2.5.2", require: false
  gem "rubocop", "~> 1.57.2"
  gem "web-console", "~> 4.2.1"
end

group :test do
  gem "capybara", "~> 3.39.2"
  gem "selenium-webdriver", "~> 4.15.0"
end

group :development, :test do
  gem "debug", "~> 1.8.0", platforms: %i[mri windows]
  gem "faker", "~> 3.2.2", require: false
  gem "pry-byebug", "~> 3.10.1"
  gem "pry-rails", "~> 0.3.9"
  gem "rspec-rails", "~> 6.1.0"
end
