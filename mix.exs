defmodule DiscoLlama.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  defp deps do
    [
      {:phoenix_live_view, ">= 0.0.0"}
    ]
  end

  defp aliases do
    [
      setup: ["cmd mix setup"]
    ]
  end
end
