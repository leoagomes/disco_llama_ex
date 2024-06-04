defmodule DiscoLlama.Repo do
  use Ecto.Repo,
    otp_app: :disco_llama,
    adapter: Ecto.Adapters.Postgres
end
