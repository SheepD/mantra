# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mantra,
  ecto_repos: [Mantra.Repo]

# Configures the endpoint
config :mantra, Mantra.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ij/ysBrUopXD+dtW5u6JHoZUTEbmbdpj3uvBi7ZVgJTBl3KfT3P/uuA1gC6H5LyD",
  render_errors: [view: Mantra.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mantra.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

# config :guardian, Guardian,
#   allowed_algos: ["HS512"], # optional
#   verify_module: Guardian.JWT,  # optional
#   issuer: "Mantra",
#   ttl: { 30, :days },
#   verify_issuer: true, # optional
#   secret_key: <guardian secret key>,
#   serializer: Mantra.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
