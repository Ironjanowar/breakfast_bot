defmodule BreakfastBot.Repo do
  use Ecto.Repo,
    otp_app: :breakfast_bot,
    adapter: Ecto.Adapters.Postgres
end
