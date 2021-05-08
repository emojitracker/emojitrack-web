require 'sinatra/base'
require 'dalli'
require 'rack-cache'

class WebAPI < Sinatra::Base

  # the REST API is now handled in a different service, redirect any legacy API calls
  get '/:path' do
    cache_control :public, max_age: 300
    redirect "#{API_SERVER}/#{params[:path]}", 301
  end

end
