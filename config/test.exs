import Config

config :disco_llama, DiscoLlama.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "disco_llama_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :disco_llama_web, DiscoLlamaWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "bXpTl6efxbAuRWSrhqzav2gSDlwUV0Q0Wg2NAR8XvsSbn52ZeP+GMEznZCQ7edqM",
  server: false

config :logger, level: :warning
config :disco_llama, DiscoLlama.Mailer, adapter: Swoosh.Adapters.Test
config :swoosh, :api_client, false
config :phoenix, :plug_init_mode, :runtime
