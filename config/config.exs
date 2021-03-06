# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_sample,
  ecto_repos: [PhoenixSample.Repo]

# Configures the endpoint
config :phoenix_sample, PhoenixSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VCEQ9/ekgmxX5tM3MuubrOE4XLqFRK0TvFe4iyNoimbMbRB5cSqZazFskXxHK6X1",
  render_errors: [view: PhoenixSampleWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixSample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# guardian
config :phoenix_sample, PhoenixSample.Auth.Guardian,
  issuer: "PhoenixSample",
  secret_key: "aaaaaaaaaabbbbbbbbbbcccccccccc"
