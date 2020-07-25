defmodule Pinq.Repo do
  use Ecto.Repo,
    otp_app: :pinq,
    adapter: Ecto.Adapters.Postgres
end
