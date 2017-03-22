defmodule ServeThis.Mixfile do
  use Mix.Project

  def project do
    [app: :serve_this,
     version: "1.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     escript: escript(),
     description: description(),
     package: package()]
  end

  def application do
    [applications: [:logger, :cowboy, :plug],
     mod: {ServeThis, []}]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"}
    ]
  end

  defp escript do
    [main_module: ServeThis]
  end

  defp description do
    "An escript that serves the current directory over HTTP."
  end

  defp package do
    [
      files: ["lib", "templates", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Eric Entin"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/antipax/serve_this"
      }
    ]
  end
end
