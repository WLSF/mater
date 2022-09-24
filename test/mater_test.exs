defmodule MaterTest do
  use ExUnit.Case
  doctest Mater

  defmodule Normal.Github do
    alias Mater

    @endpoint ~s(https://api.github.com/graphql)
    @auth [{"Authorization", "Bearer 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"}]

    def fetch_repo(owner, name) do
      query = """
        query {
          repository(owner: "#{owner}", name: "#{name}") {
            id,
            name,
            pushedAt
          }
        }
        """

      Mater.call(@endpoint, query, @auth)
    end
  end

  describe "Mater basics" do
    test "fetch data from a Github repo by owner and name" do
      assert %{"data" => %{"repository" => %{"name" => "mater"}}} = Normal.Github.fetch_repo("WLSF", "mater")
    end
  end
end
