defmodule BreakfastBot.Repo.Migrations.CreateMenus do
  use Ecto.Migration

  alias BreakfastBot.Db.Enums.FoodTypeEnum

  def up do
    FoodTypeEnum.create_type()

    create table("foodstuffs") do
      add(:name, :string)
      add(:type, FoodTypeEnum.type())

      timestamps()
    end
  end

  def down do
    drop(table("foodstuffs"))
    BreakfastBot.Db.Enums.FoodTypeEnum.drop_type()
  end
end
