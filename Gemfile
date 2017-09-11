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

#add webpack support for react
gem 'webpacker'

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

#for coveralls
group :test do
  gem 'coveralls', require: false
end

group :development, :test do
  gem 'rails_rest_vote'
  gem 'faker'
  gem 'phantomjs'
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
