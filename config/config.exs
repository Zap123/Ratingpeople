# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ratingpeople,
  ecto_repos: [Ratingpeople.Repo]

# Configures the endpoint
config :ratingpeople, Ratingpeople.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pWMX3GYgGnG/BrUmr8uifCQf/dV07dotc1JqZ0xws6mTCjxKuYjEtnrJmBg565xP",
  render_errors: [view: Ratingpeople.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ratingpeople.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
