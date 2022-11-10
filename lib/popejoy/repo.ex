defmodule Popejoy.Repo do
  use Ecto.Repo,
    otp_app: :popejoy,
    adapter: Ecto.Adapters.Postgres
end
