import Config

config :breakfast_bot,
  ecto_repos: [BreakfastBot.Repo]

config :breakfast_bot, BreakfastBot.Repo,
  database: "breakfast_bot_repo",
  username: "breakfast_bot",
  password: "breakfast_bot",
  hostname: "localhost"

config :ex_gram,
  token: {:system, "BOT_TOKEN"}
