defmodule Flyp.Repo do
  use Ecto.Repo,
    otp_app: :flyp,
    adapter: Ecto.Adapters.Postgres
end
