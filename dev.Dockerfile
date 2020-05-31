FROM elixir:1.10.3

# Install debian packages
RUN apt-get update
RUN apt-get install -y build-essential inotify-tools postgresql-client

# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.5.1

# set build ENV
ENV MIX_ENV=dev

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# RUN mkdir /code
WORKDIR /code
EXPOSE 4000
