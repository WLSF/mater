defmodule MaterTest do
  use ExUnit.Case
  doctest Mater

  defmodule Github do
    alias Mater

    @endpoint ~s(https://api.github.com/graphql)

    def fetch_repo(owner, name) do
      Mater.call(@endpoint, %{query: query(), variables: %{owner: owner, name: name}}, auth())
    end

    defp query do
      """
      query fetchRepository($owner: String!, $name: String!) {
        repository(owner: $owner, name: $name) {
          name
        }
      }
      """
    end

    defp auth,
      do: [auth: "Bearer #{System.get_env("GRAPHQL_KEY")}"]
  end

  describe "Mater Github" do
    test "fetch data from a Github repo by owner and name" do
      assert {:ok, %{"data" => %{"repository" => %{"name" => "mater"}}}} =
               Github.fetch_repo("WLSF", "mater")
    end
  end

  describe "Mater Errors" do
    test "returns error when invalid graphql endpoint" do
      assert {:error, %HTTPoison.Error{reason: :nxdomain}} = Mater.call("invalid_endpoint", %{})
    end

    test "returns error when empty string endpoint" do
      assert {:error, :no_scheme} = Mater.call("", %{})
    end
  end
end
