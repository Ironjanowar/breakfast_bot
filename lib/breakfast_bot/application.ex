defmodule BreakfastBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    token = ExGram.Config.get(:ex_gram, :token)

    children = [
      ExGram,
      BreakfastBot.Repo,
      {BreakfastBot.Bot, [method: :polling, token: token]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BreakfastBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
