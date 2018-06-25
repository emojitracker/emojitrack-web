# emojitrack :dizzy:
emojitrack tracks realtime emoji usage on twitter!

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
