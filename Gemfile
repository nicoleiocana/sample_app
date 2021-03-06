source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Sass-powered version of Bootstrap 3
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'sassc-rails', '>= 2.1.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# jQuery and the jQuery-ujs driver
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.12'

# Easily generate fake data: names, addresses, phone numbers, etc.
gem 'faker', '~> 1.9', '>= 1.9.3'
# provides a simple API for performing paginated queries with Active Record
gem 'will_paginate', '~> 3.1', '>= 3.1.7'
# Hooks into will_paginate to format the html to match Twitter Bootstrap styling
gem 'bootstrap-will_paginate', '~> 1.0'

# Upload files, map them to a range of ORMs, store them on different backends.
gem 'carrierwave', '~> 1.3', '>= 1.3.1'

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick', '~> 4.9', '>= 4.9.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Generate and install a favicon for all platforms with RealFaviconGenerator.
gem 'rails_real_favicon', '~> 0.0.12'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  gem 'minitest', '~> 5.11', '>= 5.11.3'
  gem 'minitest-reporters', '~> 1.3', '>= 1.3.6'
  gem 'guard', '~> 2.15'
  gem 'guard-minitest', '~> 2.4', '>= 2.4.6'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  # Ruby interface to the PostgreSQL RDBMS
  gem 'pg', '~> 1.1', '>= 1.1.4'
  
  # The Ruby cloud services library
  gem 'fog', '~> 2.1'
  
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
