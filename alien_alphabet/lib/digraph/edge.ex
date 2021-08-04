defmodule Edge do
  defstruct [:start, :end]

  def new(a, b) do
    %Edge{start: a, end: b}
  end

  def to_dot(%Edge{start: s, end: e}) do
    "  \"#{s}\" -> \"#{e}\""
  end

  def from_alphabetical_lists(a_list, b_list) do
    case {a_list, b_list} do
      {[a | as], [b | bs]} ->
        if a == b do
          from_alphabetical_lists(as, bs)
        else
          {:ok, Edge.new(a, b)}
        end

      _ ->
        :error
    end
  end
end
