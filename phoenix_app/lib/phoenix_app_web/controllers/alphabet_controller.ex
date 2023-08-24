defmodule PhoenixAppWeb.AlphabetController do
  use PhoenixAppWeb, :controller

  # plug PhoenixAppWeb.Plugs.Alphabet, "a,b,c,d,e,f"

  def input(conn, params) do
    alphabet =
      case Map.get(params, "words") do
        nil -> "a,b,c,d,e,f"
        a -> a
      end

    graph = alphabet |> String.split(",") |> Digraph.from_alphabetical_order() |> Digraph.to_dot()

    render(conn, :alphabet, alphabet: graph)
  end
end
