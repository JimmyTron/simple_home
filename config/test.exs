use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :simple_home, SimpleHome.Repo,
  username: "postgres",
  password: "postgres",
  database: "simple_home_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :simple_home, SimpleHomeWeb.Endpoint,
  http: [port: 4002],
  server: true

config :simple_home, :sql_sandbox, true
# Print only warnings and errors during test
config :logger, level: :warn

config :phoenix_integration,
  endpoint: SimpleHome.Endpoint

config :wallaby,
  driver: Wallaby.Chrome,
  chrome: [headless: true]
