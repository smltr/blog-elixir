defmodule Samt.Repo do
  use Ecto.Repo,
    otp_app: :samt,
    adapter: Ecto.Adapters.Postgres
end
