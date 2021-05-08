require 'sinatra/base'
require 'slim'
require 'coffee-script'
require 'sass'
require 'dalli'
require 'rack-cache'
require 'emoji_data'

require_relative 'lib/config'

class WebApp < Sinatra::Base

  configure :production, :staging do
    require 'newrelic_rpm'
  end

  helpers do
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == [ENV['AUTH_USER'], ENV['AUTH_PASS']]
    end
  end

  set :public_folder, 'public'
  set :static_cache_control, [:public, max_age: 60000] # 1000 mins.

  get '/' do
    cache_control :public, max_age: 600  # 10 mins. #disable until password is gone
    # protected! if ENV['RACK_ENV'] == 'production'

    slim :index
  end

  get '/d/:uid' do
    cache_control :public, max_age: 60000  # 1000 mins.
    redirect "/details/#{params[:uid]}"
  end

  get '/details/:uid' do
    cache_control :public, max_age: 600  # 10 mins.

    @emoji_char = EmojiData.find_by_unified( params[:uid] )
    slim :details
  end

  # MOVED
  get '/data' do
    redirect '/api/scores', 301
  end

  # MOVED
  get '/stats' do
    redirect '/api/stats', 301
  end

  get '/application.js' do
    cache_control :public, max_age: 600  # 10 mins.
    coffee :application
  end

  get '/assets/main.css' do
    cache_control :public, max_age: 600  # 10 mins.
    scss :main
  end

  # regex match for how sinatra sees unicode emoji chars in routing
  # humanized regex: block of 'percent sign followed by two word chars, exactly four in a row'
  # either exactly one or two of the above in a row (to get doublebyte)
  get %r{\A/((?:(?:\%\w{2}){4}){1,2})\z} do |char|
    cache_control :public, max_age: 6000  # 100 mins.
    unified_id = EmojiData.char_to_unified(char)
    redirect "/details/#{unified_id}"
  end
end
