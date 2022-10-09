defmodule Mater do
  @moduledoc false

  @doc """
  Executes a HTTP request for a GraphQL Endpoint with the given:
    * endpoint
    * query (containing: query, variables, operationName)
    * opts (keyword list just in case you need some auth)
  """
  @spec call(
          endpoint :: String.t(),
          body :: %{query: String.t(), variables: String.t()},
          opts :: Keyword.t()
        ) :: {:ok, response :: map()} | {:error, reason :: map()}

  def call(endpoint, body, opts \\ []) do
    case HTTPoison.post(endpoint, Jason.encode!(body), decode_opts(opts)) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, Jason.decode!(body)}

      error ->
        error
    end
  end

  defp decode_opts(opts),
    do: decode_opts(opts, [])

  defp decode_opts([{:auth, auth} | rest], acc),
    do: decode_opts(rest, [{"Authorization", auth} | acc])

  defp decode_opts([], acc),
    do: acc
end
