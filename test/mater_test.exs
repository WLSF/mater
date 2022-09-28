defmodule MaterTest do
  use ExUnit.Case
  doctest Mater

  defmodule Github do
    alias Mater

    @endpoint ~s(https://api.github.com/graphql)

    def fetch_repo(owner, name) do
      query = """
      query fetchRepository($owner: String!, $name: String!){
        repository(owner: $owner, name: $name) {
          name
        }
      }
      """

      Mater.call(@endpoint, %{query: query, variables: %{owner: owner, name: name}}, auth())
    end

    defp auth do
      [{"Authorization", "Bearer #{System.get_env("GRAPHQL_KEY")}"}]
    end
  end

  describe "Mater basics" do
    test "fetch data from a Github repo by owner and name" do
      assert {:ok, %{"data" => %{"repository" => %{"name" => "mater"}}}} =
               Github.fetch_repo("WLSF", "mater")
    end
  end
end
