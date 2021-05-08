require 'uri'
require 'socket'

#convenience method for reading booleans from env vars
def to_boolean(s)
  s and !!s.match(/^(true|t|yes|y|1)$/i)
end

# verbose mode or no
VERBOSE = to_boolean(ENV["VERBOSE"]) || false

# endpoint setup
API_SERVER    = ENV['API_SERVER']    || 'https://api.emojitracker.com/v1'
STREAM_SERVER = ENV['STREAM_SERVER'] || 'https://stream.emojitracker.com'

# environment checks
def is_production?
  ENV["RACK_ENV"] == 'production'
end

def is_development?
  ENV["RACK_ENV"] == 'development'
end

# configure logging to graphite in production
def graphite_log(metric, count)
  @hostedgraphite_apikey = ENV['HOSTEDGRAPHITE_APIKEY']
  # puts "Graphite log - #{metric}: #{count}" if VERBOSE
  if is_production?
    sock = UDPSocket.new
    sock.send @hostedgraphite_apikey + ".#{metric} #{count}\n", 0, "carbon.hostedgraphite.com", 2003
  end
end

# same as above but include heroku dyno hostname
def graphite_dyno_log(metric,count)
  dyno = ENV['DYNO'] || 'unknown-host'
  metric_name = "#{dyno}.#{metric}"
  graphite_log metric_name, count
end
