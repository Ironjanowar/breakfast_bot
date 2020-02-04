defmodule BreakfastBot.Bot do
  @bot :breakfast_bot

  use ExGram.Bot,
    name: @bot

  alias BreakfastBot.Model.Foodstuff

  require Logger

  middleware(ExGram.Middleware.IgnoreUsername)

  def bot(), do: @bot

  def handle({:command, "start", _msg}, context) do
    answer(context, "Hi!")
  end

  def handle({:command, "menu", _msg}, context) do
    with {:ok, drinks} <- Foodstuff.getFoodstuffByType(:drink),
         {:ok, foods} <- Foodstuff.getFoodstuffByType(:food),
         parsed_drinks <- Enum.map(drinks, &Foodstuff.prettyPrint/1),
         parsed_foods <- Enum.map(foods, &Foodstuff.prettyPrint/1) do
      answer(
        context,
        """
        📜_Here is the menu:_📜
        *Drinks:*
        #{parsed_drinks}

        *Food:*
        #{parsed_foods}
        """,
        parse_mode: "Markdown"
      )
    else
      err ->
        Logger.error("#{err}")
        answer(context, "I'm sorry! There was an error getting the menu")
    end
  end
end
