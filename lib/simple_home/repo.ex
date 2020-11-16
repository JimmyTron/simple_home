defmodule SimpleHome.Repo do
  use Ecto.Repo,
    otp_app: :simple_home,
    adapter: Ecto.Adapters.Postgres
end
