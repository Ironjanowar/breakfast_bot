defmodule BreakfastBot.Model.Foodstuff do
  use Ecto.Schema

  import Ecto.Query, only: [from: 2]
  alias BreakfastBot.Repo

  schema "foodstuffs" do
    field(:name, :string)
    field(:type, :string)
  end

  def getFoodstuffBy(query), do: {:ok, Repo.all(query)}

  def getFoodstuffByName(name),
    do: from(f in __MODULE__, where: f.name == ^name) |> getFoodstuffBy()

  def getFoodstuffByType(type) when type in [:drink, :food],
    do: from(f in __MODULE__, where: f.type == ^Atom.to_string(type)) |> getFoodstuffBy()

  def getFoodstuffByType(type),
    do: {:error, "'#{type}' is not a valid foodstuff type"}

  def getFoodstuffById(id),
    do: from(f in __MODULE__, where: f.id == ^id) |> getFoodstuffBy()

  def prettyPrint(foodstuff), do: "    - #{foodstuff.name}\n"
end
