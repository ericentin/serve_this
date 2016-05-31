defmodule ServeThis do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ServeThis.Router, [], [port: port()])
    ]

    opts = [strategy: :one_for_one, name: ServeThis.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def main(_args) do
    IO.puts "Serving HTTP on port #{port()}..."

    :timer.sleep(:infinity)
  end

  defp port do
    port = System.get_env("PORT")

    if port, do: String.to_integer(port), else: 8000
  end
end
