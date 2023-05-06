defmodule MaterTest do
  use ExUnit.Case
  doctest Mater

  defmodule TMDB do
    @moduledoc """
    Handles queries into the The Movie DB GraphQL Endpoint.
    """

    @endpoint ~s(https://tmdb.apps.quintero.io/)

    def call(name),
      do: Mater.call(@endpoint, %{query: query(), variables: %{name: name}})

    defp query do
      """
      query SearchMovie($name: String!) {
        movies {
          search(term: $name) {
            totalCount
          }
        }
      }
      """
    end
  end

  describe "The Movie DB" do
    test "returns total count of movies based the term" do
      assert {:ok, []} = TMDB.call("Matrix")
    end
  end

  describe "Mater Errors" do
    test "returns error when invalid graphql endpoint" do
      assert {:error, :invalid_endpoint} = Mater.call("invalid_endpoint", %{})
    end

    test "returns error when empty string endpoint" do
      assert {:error, :invalid_endpoint} = Mater.call("", %{})
    end
  end
end
