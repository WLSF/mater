defmodule MaterTest do
  use ExUnit.Case
  doctest Mater

  test "greets the world" do
    assert Mater.hello() == :world
  end
end
