import Config

config :disco_llama,
  ecto_repos: [DiscoLlama.Repo]

config :disco_llama, DiscoLlama.Mailer, adapter: Swoosh.Adapters.Local

config :disco_llama_web,
  ecto_repos: [DiscoLlama.Repo],
  generators: [context_app: :disco_llama]

config :disco_llama_web, DiscoLlamaWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: DiscoLlamaWeb.ErrorHTML, json: DiscoLlamaWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: DiscoLlama.PubSub,
  live_view: [signing_salt: "ByFHJauU"]

config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/disco_llama_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/disco_llama_web/assets", __DIR__)
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
