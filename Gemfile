source 'https://rubygems.org'

gem 'rails', '3.2.21'
gem 'haml'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'webrick', '~> 1.3.1'
end

group :test do
	gem 'cucumber-rails', :require => false
	gem 'cucumber-rails-training-wheels'

	gem 'database_cleaner'
	gem 'capybara'
	gem 'launchy'
end


group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Gems for bootstrap integration.
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

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