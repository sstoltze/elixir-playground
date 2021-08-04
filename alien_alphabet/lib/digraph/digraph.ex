defmodule Digraph do
  defstruct [:edges]

  def new() do
    %Digraph{edges: []}
  end

  def from_alphabetical_order(words) do
    from_alphabetical_order(words, %Digraph{edges: []})
  end

  defp from_alphabetical_order(words, graph) do
    case words do
      [x, y | ws] -> from_alphabetical_order([y | ws], update_digraph(graph, x, y))
      _ -> graph
    end
  end

  def to_dot(%Digraph{edges: es}) do
    "digraph {\n#{Enum.join(Enum.map(es, &Edge.to_dot/1), "\n")}\n}"
  end

  defp update_digraph(%Digraph{edges: es}, x, y) do
    case Edge.from_alphabetical_lists(String.graphemes(x), String.graphemes(y)) do
      {:ok, edge} -> %Digraph{edges: [edge | es]}
      :error -> %Digraph{edges: es}
    end
  end
end
