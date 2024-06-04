import Config

config :disco_llama, DiscoLlama.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "disco_llama_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :disco_llama_web, DiscoLlamaWeb.Endpoint,
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "AB5LiReEKhWPuX72FfibB+MearX6TAYvaBk2n5AQMTsWveLNag0+r0Bk3bJjU8nH",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

config :disco_llama_web, DiscoLlamaWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/disco_llama_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :disco_llama_web, dev_routes: true
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :plug_init_mode, :runtime
config :phoenix_live_view, :debug_heex_annotations, true
config :swoosh, :api_client, false
config :phoenix, :stacktrace_depth, 20
