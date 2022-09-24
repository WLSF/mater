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
  @spec call(String.t(), map(), Keyword.t()) :: {:ok, map()} | {:error, map()}
  def call(endpoint, query, opts) do
  end
end
