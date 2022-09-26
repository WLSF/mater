defmodule Mater do
  @moduledoc """
  Documentation for `Mater`.
  """

  @doc """
  Executes a HTTP request for a GraphQL Endpoint with the given:
    * endpoint
    * query (containing: query, variables, operationName)
    * opts (simples keyword list just in case you need some auth)

  ## Examples

      iex> Mater.call("https://api.github.com/graphql", %{query: "query {repository...}"}, [{"Authorization", "Bearer ..."}])

  """
  @spec call(endpoint, body, opts) :: {:ok, map()} | {:error, map()}
    when
      endpoint: String.t(),
      body: %{query: String.t(), variables: map()},
      opts: Keyword.t()
  def call(endpoint, query, opts) do
  end
end
