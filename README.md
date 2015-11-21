# emojitrack :dizzy:
emojitrack tracks realtime emoji usage on twitter!

This is but a small part of emojitracker's infrastructure.  Major components of the project include:

 - **[emojitrack-web](//github.com/mroth/emojitrack)** _the web frontend and application server (you are here!)_
 - **[emojitrack-feeder](//github.com/mroth/emojitrack-feeder)** _consumes the Twitter Streaming API and feeds our data pipeline_
 - **emojitrack-streamer** _handles streaming updates to clients via SSE_
    * [ruby version](//github.com/mroth/emojitrack-streamer) (deprecated)
    * [nodejs version](//github.com/mroth/emojitrack-nodestreamer)
    * [go version](//github.com/mroth/emojitrack-gostreamer) (currently used in production)
    * [streamer API spec](//github.com/mroth/emojitrack-streamer-spec) _defines the streamer spec, tests servers in staging_


Additionally, many of the libraries emojitrack uses have also been carved out into independent emoji-related open-source projects, see the following:

 - **[emoji_data.rb](//github.com/mroth/emoji_data.rb)** _utility library for handling the Emoji vs Unicode nightmare (Ruby)_
 - **[emoji-data-js](//github.com/mroth/emoji-data-js)** _utility library for handling the Emoji vs Unicode nightmare (Nodejs port)_
 - **[exmoji](//github.com/mroth/exmoji)** _utility library for handling the Emoji vs Unicode nightmare (Elixir/Erlang port)_
 - **[emojistatic](//github.com/mroth/emojistatic)** _generates static emoji assets for a public CDN_

As well as some general purpose libraries:

 - **[cssquirt](//github.com/mroth/cssquirt)** _Embeds images (or directories of images) directly into CSS via the Data URI scheme_
 - **[sse-bench](//github.com/mroth/sse-bench)** _benchmarks Server-Sent Events endpoints_

---
## emojitrack-web
This is the main web application for the Emojitracker frontend and REST API.

### Development Setup

#### Frontend + REST API
 1. Make sure you have Ruby 2.2.x installed and `gem install bundler`.
 2. Get the repository and basic dependencies going:

        git clone mroth/emojitrack
        cd emojitrack
        bundle install --without=production

 3. Copy `.env-sample` to `.env` and configure required variables.
 4. Make sure you have Redis installed and running.  The rules in `lib/config.rb` currently dictate the order a redis server instance is looked for.  Depending on what you are doing, you may need to have the db populated from a emojitrack-feeder instance.
 5. Run all processes via `foreman start`.


#### Frontend development only

You can do work on the web frontend only by utilizing the production REST API.  Set `FRONTEND_ONLY=true` in your `.env` file, and the API routes will not be loaded and the AJAX calls will be routed to the production API instead of localhost.
