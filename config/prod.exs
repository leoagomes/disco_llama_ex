import Config

config :disco_llama_web, DiscoLlamaWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :swoosh, :api_client, DiscoLlama.Finch
config :swoosh, local: false
config :logger, level: :info
