source 'https://rubygems.org/'

ruby '2.4.0'

gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'nokogiri'
gem 'jquery-rails'
gem 'dotenv-rails'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '3.8.0'

#add webpack support for react
gem 'webpacker', '~> 3.0'
gem 'react_on_rails', '~> 9.0.1'

#add deviser for user auth
gem 'devise'

#these gems are for styling only
gem 'bootstrap-sass', '~> 3.3.7'
gem 'bootstrap_form'

#these gems are for email styling only
gem 'inky-rb', require: 'inky'
gem 'premailer-rails'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "capybara-screenshot"
  gem "chromedriver-helper"
  gem "coveralls", require: false
  gem "database_cleaner"
  gem "generator_spec"
  gem "rspec-retry"
  gem "selenium-webdriver", "<3.0.0"
end

group :development, :test do
  gem 'faker'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'poltergeist'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy', require: false
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'mailcatcher'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mini_racer', platforms: :ruby
