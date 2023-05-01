defmodule Mater do
  @moduledoc """
  Mater is a GraphQL Client Library for Elixir, holds connections with
  GraphQL Servers (Endpoints) through HTTP requests.

  The main functionality is `Mater.call/3`.
  """

  @doc """
  Executes a HTTP request for a GraphQL Endpoint with the given:
    * endpoint
    * query (containing: query, variables, operationName)
    * opts (keyword list just in case you need some auth)

  ## Examples

      iex> Mater.call("", %{})
      {:error, :invalid_endpoint}
  """
  @spec call(
          endpoint :: String.t(),
          body :: %{query: String.t(), variables: String.t()},
          opts :: Keyword.t()
        ) :: {:ok, response :: map()} | {:error, reason :: map()}

  def call(endpoint, body, opts \\ [])

  def call("", _, _),
    do: {:error, :invalid_endpoint}

  def call(endpoint, body, opts),
    do: Mater.HTTP.call(endpoint, body, opts)
end
