# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :workshop, WorkshopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XI2w4bBCH6gSR5sMzJXoRZM9u5cvAPLSolsZfVA2QBJq/RSKSfx2BvW3133nbI5L",
  render_errors: [view: WorkshopWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Workshop.PubSub,
  live_view: [signing_salt: "6d4yqAGk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :workshop, ecto_repos: [WorkshopStorage.Repo]

config :workshop, WorkshopStorage.Repo,
  hostname: "localhost",
  username: "postgres",
  password: "postgres",
  database: "workshop_dev"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
