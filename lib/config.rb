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
