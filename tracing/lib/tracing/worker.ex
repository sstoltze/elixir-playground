defmodule Tracing.Worker do
  def call(n) do
    Tracing.Id.changeset(%{
      called_with: n,
      identifier: :crypto.strong_rand_bytes(10)
    })
    |> Tracing.Repo.insert()
  end
end
