defmodule AdventDayTwoTest do
  use ExUnit.Case
  doctest AdventDayTwo

  test "greets the world" do
    assert AdventDayTwo.hello() == :world
  end
end
