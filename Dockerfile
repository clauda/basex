FROM elixir:1.10.3-alpine as build

# install build dependencies
RUN apk add --update git build-base python

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build assets
COPY priv priv

# build project
COPY lib lib
RUN mix compile

# build release 
# COPY rel rel
RUN mix release --overwrite

# prepare release image
FROM alpine:3.9 AS app
RUN apk add --update bash openssl postgresql-client

RUN mkdir /app
WORKDIR /app

COPY --from=build /app/_build/prod/rel/basex ./
COPY run.prod.sh .
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app
CMD ["bash", "/app/run.prod.sh"]