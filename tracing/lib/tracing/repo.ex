defmodule Tracing.Repo do
  use Ecto.Repo,
    otp_app: :tracing,
    adapter: Ecto.Adapters.SQLite3
end
