# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :flyp,
  ecto_repos: [Flyp.Repo]

# Configures the endpoint
config :flyp, FlypWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lQCEL2N4l3Tw4h+wxDdBWQWlv874Jcwqv88weuETvDuUhobtzSMfDmKSf+pUDyqL",
  render_errors: [view: FlypWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Flyp.PubSub,
  live_view: [signing_salt: "JbjGM7qp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
