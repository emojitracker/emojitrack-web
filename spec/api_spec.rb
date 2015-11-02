require "spec_helper"
require_relative '../web_api'

# require config for now, because we haven't stubbed the external redis calls
# that the API needs to make, this is very bad form but will work for this
# quick test we need it for right now
# TODO: properly stub out redis calls so API code can be tested independently
require_relative '../lib/config'

describe WebAPI do
  it "should allow normal requests for rankings" do
    get "/rankings", format: :json
    last_response.should be_ok
  end

  it "should allow requests with referers (JSONP?) for rankings" do
    get "/rankings", {}, {'HTTP_REFERER' => 'http://foo.com'}
    last_response.should be_ok
  end
end
