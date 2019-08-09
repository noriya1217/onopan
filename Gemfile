source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Core
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails', '~> 5.2.3'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Frontend
# gem 'bootstrap', '~> 4.3.1'
gem 'coderay'
gem 'coffee-rails', '~> 4.2'
# gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'

# Backend
gem 'friendly_id', '~> 5.2.4'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
gem 'seed-fu', '~> 2.3'
gem 'uglifier', '>= 1.3.0'
# gem 'mini_racer', platforms: :ruby
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development

# Authentication
gem 'devise'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'letter_opener_web'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'guard-rspec', require: false
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
