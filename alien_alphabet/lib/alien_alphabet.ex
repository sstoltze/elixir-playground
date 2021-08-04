defmodule AlienAlphabet do
  @moduledoc """
  Documentation for AlienAlphabet.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AlienAlphabet.hello()
      :world

  """
  def read_words() do
    read_words([])
  end

  def read_words(l) do
    case IO.gets("") do
      :eof -> Enum.reverse(l)
      s -> read_words([s | l])
    end
  end

  def print_graph(words) do
    g = Digraph.from_alphabetical_order(words)
    IO.puts(Digraph.to_dot(g))
  end

  def main(_args \\ []) do
    words = AlienAlphabet.read_words()
    AlienAlphabet.print_graph(words)
  end
end
