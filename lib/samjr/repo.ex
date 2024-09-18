defmodule Samjr.Repo do
  use Ecto.Repo,
    otp_app: :samjr,
    adapter: Ecto.Adapters.Postgres
end
