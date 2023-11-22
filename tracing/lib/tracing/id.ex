defmodule Tracing.Id do
  use Ecto.Schema

  schema "ids" do
    field :identifier, :string
    field :called_with, :decimal
  end

  def changeset(tracing_id \\ %__MODULE__{}, params) do
    tracing_id
    |> Ecto.Changeset.cast(params, [:identifier, :called_with])
    |> Ecto.Changeset.validate_required([:called_with])
  end
end
