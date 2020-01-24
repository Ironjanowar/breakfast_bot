defmodule BreakfastBot.Db.Enums do
  import EctoEnum

  defenum(FoodTypeEnum, :food_type, [:drink, :food])
end
