defmodule BreakfastBotTest do
  use ExUnit.Case
  doctest BreakfastBot

  test "greets the world" do
    assert BreakfastBot.hello() == :world
  end
end
