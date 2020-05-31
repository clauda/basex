defmodule Basex.Repo do
  use Ecto.Repo,
    otp_app: :basex,
    adapter: Ecto.Adapters.Postgres
end
