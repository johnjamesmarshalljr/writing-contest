source 'http://rubygems.org'
gem 'bigdecimal', '1.3.5'
gem 'sinatra'
gem 'activerecord', '~> 6.1', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'

group :development, :test do 
  gem 'sqlite3', '~> 1.3.6'    #gem to use in development-test environment
end

group :production do 
  gem 'pg', '~> 0.18'
end
gem 'pg', '~> 0.18'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'corneal'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner-active_record'
end
