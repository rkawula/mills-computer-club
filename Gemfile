source "https://rubygems.org"
gem 'sinatra', '1.0'
gem 'rails', '3.2.21'
gem 'haml'
gem 'pg'##FUTURE-BRIGHID, THIS IS A THING YOU DID!!! DON'T FORGET!

gem 'minitest'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  if ("#{RUBY_VERSION}".to_i < 2)
    gem 'debugger'
  else
    gem 'byebug'
  end
  gem 'webrick', '~> 1.3.1'
end

group :test do
	gem 'cucumber-rails', :require => false
	gem 'cucumber-rails-training-wheels'

	gem 'database_cleaner'
	gem 'capybara'
	gem 'launchy'
end

gem 'momentjs-rails'
gem 'fullcalendar-rails'
gem 'omniauth-google-oauth2'
gem 'json'

group :production do
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
