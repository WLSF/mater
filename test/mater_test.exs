defmodule MaterTest do
  use ExUnit.Case
  doctest Mater

  describe "Mater Errors" do
    test "returns error when invalid graphql endpoint" do
      assert {:error, :invalid_endpoint} = Mater.call("invalid_endpoint", %{})
    end

    test "returns error when empty string endpoint" do
      assert {:error, :invalid_endpoint} = Mater.call("", %{})
    end
  end
end
