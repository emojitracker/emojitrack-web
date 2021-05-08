require 'sinatra/base'
require_relative 'lib/config'

class WebAdmin < Sinatra::Base

  get '/?' do
    slim :stream_admin
  end

end
