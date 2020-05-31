# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :basex,
  ecto_repos: [Basex.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :basex, BasexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DHvQG5lm4bp4RZk+x8SANOeCbBGdBKqHd7U087FIrgVDINES/w1yYbJmEuU/IusU",
  render_errors: [view: BasexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Basex.PubSub,
  live_view: [signing_salt: "IQLGFbNH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
