defmodule Mater.HTTP.Interface do
  @moduledoc """
  This module represents the interface functions that
  should be implemented when using HTTP Clients to
  access a GraphQL API resource.
  """

  @type endpoint :: String.t()
  @type body :: %{query: String.t(), variables: String.t()}
  @type opts :: Keyword.t()
  @type response :: {:ok, map()} | {:error, map()}

  @callback call(endpoint, body, opts) :: response
end
