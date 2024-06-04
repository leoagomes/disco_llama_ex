defmodule DiscoLlamaBot.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DiscoLlamaBot.Consumer
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: DiscoLlamaBot.Supervisor)
  end
end
