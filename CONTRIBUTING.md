# Contributor Guidelines (kinda)

While this is shockingly still running in production, the plan is to migrate
off this frontend to a new one rewritten from scratch to be more maintainable,
hosted as static files and running on top of the newer [REST API][rest-api].

[rest-api]: https://github.com/emojitracker/emojitrack-rest-api

## Local development

A VSCode devcontainer is provided with appropriate versions of Ruby, etc.

First copy `.env-sample` to `.env`.  Then, to install and run:

    bundle install --without=production
    heroku local

Since the web interface is "read only" it just talks to the production REST and
Streaming servers for any data (and currently the JS libraries are hosted on CDNs
so you wouldn't be able to do anything without an internet connection anyhow.)

## Production

Currently handled on Heroku, to add remotes manually after cloning the repository:

    heroku git:remote --remote production emojitrack-web
    heroku git:remote --remote staging emojitrack-web-staging

Simply git pushing to either will build and update.
