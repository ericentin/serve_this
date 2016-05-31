defmodule ServeThis.Mixfile do
  use Mix.Project

  def project do
    [app: :serve_this,
     version: "1.0.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     escript: escript]
  end

  def application do
    [applications: [:logger, :cowboy, :plug],
     mod: {ServeThis, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"}
    ]
  end

  defp escript do
    [main_module: ServeThis]
  end
end
