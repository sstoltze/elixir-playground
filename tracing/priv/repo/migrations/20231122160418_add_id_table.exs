defmodule Tracing.Repo.Migrations.AddIdTable do
  use Ecto.Migration

  def change do
    create table("ids") do
      add :identifier, :string
      add :called_with, :decimal
    end
  end
end
