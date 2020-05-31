# Basex API [![Build Status](https://travis-ci.com/clauda/basex.svg?branch=master)](https://travis-ci.com/clauda/basex)

Phoenix API Starter

How to set up this project:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Docker

Development mode

`docker-compose build`   
   
`docker-compose up` 

### Deploy
   
Using releases + heroku containers   
   
Phoenix Release `MIX_ENV=prod mix release`   
Container build `docker build . -t phoenix/basex`   
Running container `docker run -it --rm -e ECTO_DATABASE_URL=$ECTO_DATABASE_URL -e SECRET_KEY_BASE=$SECRET_KEY_BASE phoenix/basex:latest`

Deploying to heroku `git push heroku master`

### Tests

`mix test`