defmodule BreakfastBot.Bot do
  @bot :breakfast_bot

  use ExGram.Bot,
    name: @bot

  middleware(ExGram.Middleware.IgnoreUsername)

  def bot(), do: @bot

  def handle({:command, "start", _msg}, context) do
    answer(context, "Hi!")
  end

  def handle({:command, "menu", _msg}, context) do
    answer(context, "Here is the menu:")
  end
end
