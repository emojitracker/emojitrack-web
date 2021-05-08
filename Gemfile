source 'https://rubygems.org'
ruby '2.7.3'

group :web, :feeder, :streamer do
  gem 'redis', '~> 3.0.7'
  gem 'hiredis', '~> 0.6.0'
  gem 'oj', '~> 2.18.5'
end

group :web, :feeder do
  gem 'emoji_data', '~> 0.2.0'
end

group :web do
  gem 'sinatra', '~> 1.4.6'
  gem 'slim', '~> 2.0.2'
  gem 'coffee-script', '~> 2.2.0'
  gem 'sass', '~> 3.2.12', :require => 'sass'
  gem 'unicorn', '~> 4.8.3'
  gem 'dalli', '~> 2.7.4'
  gem 'rack-cache', '~> 1.5.1'
  gem 'rack-timeout', '~> 0.3.2'
  gem 'memcachier', '~> 0.0.2'
end

group :development do
  gem 'rspec', '~> 2.14.1'
end

group :production do
  gem 'newrelic_rpm'
end
