defmodule BreakfastBot.Repo.Migrations.CreateMenus do
  use Ecto.Migration

  def up do
    BreakfastBot.Db.Enums.FoodTypeEnum.create_type()

    create table("menus") do
      add(:name, :string)
      add(:type, BreakfastBot.Db.Enums.FoodTypeEnum.type())

      timestamps()
    end
  end

  def down do
    drop(table("menus"))
    BreakfastBot.Db.Enums.FoodTypeEnum.drop_type()
  end
end
