# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_home,
  ecto_repos: [SimpleHome.Repo]

# Configures the endpoint
config :simple_home, SimpleHomeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ol6R0vOsS3iwVe7JCH/VarqVys9eN49ZpecbNOxsPv/u3ZrFmNaUY2J4cbs4gv5Y",
  render_errors: [view: SimpleHomeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SimpleHome.PubSub,
  live_view: [signing_salt: "XKZVsovqyI0SfguLy096W8PKJCs0PjQs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
