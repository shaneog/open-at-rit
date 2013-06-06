source 'https://rubygems.org'

# Important stuff
gem 'rails', github: 'rails/rails'
gem 'thin', '~> 1.5'

# Time parsing
gem 'chronic', '~> 0.9'

# Database
group :production do
  gem 'pg', '~> 0.14'
end
group :development, :test do
  gem 'sqlite3', '~> 1.3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.rc1'
  gem 'bootstrap-sass', '~> 2.3.1.3'
  gem 'bootswatch-rails', '~> 0.5'
  gem 'uglifier', '~> 1.3'
end

group :test do
  gem 'simplecov', '~> 0.7', require: false
end

group :development do
  gem 'binding_of_caller', '~> 0.6'
  gem 'better_errors', '~> 0.3'
end

gem 'jquery-rails', '~> 2.1'
