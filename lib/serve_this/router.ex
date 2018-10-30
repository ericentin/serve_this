defmodule ServeThis.Router do
  use Plug.Router

  template_path = Path.join([__DIR__, "..", "..", "templates", "directory_listing.html.eex"])
  require EEx
  EEx.function_from_file(:defp, :directory_listing, template_path, [:path, :children])

  plug(Plug.Logger)
  plug(Plug.Static, from: ".", at: "/")
  plug(:match)
  plug(:dispatch)

  get "/*path" do
    file_path =
      if path == [] do
        "."
      else
        Path.join(path)
      end

    index_path = Path.join(file_path, "index.html")

    case {File.stat(file_path), File.exists?(index_path)} do
      {{:ok, %{type: :directory}}, true} ->
        send_file(conn, 200, index_path)

      {{:ok, %{type: :directory}}, false} ->
        children = File.ls!(file_path)

        display_path =
          if file_path == "." do
            "/"
          else
            "/" <> file_path
          end

        send_resp(conn, 200, directory_listing(display_path, children))

      _ ->
        send_resp(conn, 404, "not found")
    end
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
