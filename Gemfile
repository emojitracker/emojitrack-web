source 'https://rubygems.org'
ruby '2.7.3'

group :web do
  gem 'sinatra', '~> 2.1.0'
  gem 'slim', '~> 4.1.0'
  gem 'coffee-script', '~> 2.4.1'
  gem 'sass', '~> 3.7.4', :require => 'sass'
  gem 'emoji_data', '~> 0.2.0'

  gem 'unicorn', '~> 5.8.0'
  gem 'rack','~> 2.2.6'
  gem 'rack-cache', '~> 1.12.1'
  gem 'rack-timeout', '~> 0.6.0'
  gem 'dalli', '~> 2.7.4'
  gem 'memcachier', '~> 0.0.2'
end

group :production do
  gem 'newrelic_rpm'
end
