source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails',     github: 'rails/rails'
gem 'arel',      github: 'rails/arel'

# Use thin as the server
gem 'thin', '~> 1.5'

# Use sqlite3 and postgresql as the databases for Active Record
group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

# Use edge version of sprockets-rails
gem 'sprockets-rails', github: 'rails/sprockets-rails'

# Use SCSS for stylesheets
gem 'sass-rails', github: 'rails/sass-rails'

# Use Bootstrap and Bootswatch for styles and scripts
gem 'bootstrap-sass', '~> 2.3.1.3'
gem 'bootswatch-rails', '~> 0.5'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', github: 'rails/coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'simplecov', '~> 0.7', require: false
end

group :development do
  gem 'binding_of_caller', '~> 0.6'
  gem 'better_errors', '~> 0.3'
end

# Time parsing
gem 'chronic', '~> 0.9'
