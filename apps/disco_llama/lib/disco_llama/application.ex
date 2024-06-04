defmodule DiscoLlama.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DiscoLlama.Repo,
      {DNSCluster, query: Application.get_env(:disco_llama, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DiscoLlama.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DiscoLlama.Finch}
      # Start a worker by calling: DiscoLlama.Worker.start_link(arg)
      # {DiscoLlama.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: DiscoLlama.Supervisor)
  end
end
