# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pinq,
  ecto_repos: [Pinq.Repo]

# Configures the endpoint
config :pinq, PinqWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AE4GdMm6T7fc63OPI7XKkik4pATIH1qVBaw48++wBe8aQq0XXBzETj2nyf0dkqAC",
  render_errors: [view: PinqWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pinq.PubSub,
  live_view: [signing_salt: "4PtAPTrR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
