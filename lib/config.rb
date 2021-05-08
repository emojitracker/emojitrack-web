

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
