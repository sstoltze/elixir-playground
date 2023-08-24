defmodule PhoenixAppWeb.Plugs.Alphabet do
  # This should definitely not have been here/exist :D
  import Plug.Conn

  def init(default), do: default

  def call(%Plug.Conn{params: %{"alphabet" => alphabet}} = conn, _default) do
    graph = build_graph(alphabet)
    assign(conn, :graph, graph)
  end

  def call(conn, default) do
    graph = build_graph(default)
    assign(conn, :graph, graph)
  end

  defp build_graph(alphabet) do
    letters = String.split(alphabet, ",")
    Digraph.from_alphabetical_order(letters)
  end
end
