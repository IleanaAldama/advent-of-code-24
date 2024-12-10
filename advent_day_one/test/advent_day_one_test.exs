defmodule AdventDayOneTest do
  use ExUnit.Case
  doctest AdventDayOne

  test "greets the world" do
    assert AdventDayOne.hello() == :world
  end
end
