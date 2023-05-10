defmodule Mater.HTTP.Poison do
  @moduledoc false

  @behaviour Mater.HTTP.Interface

  @impl true
  def call(endpoint, body, opts) do
    case HTTPoison.post(endpoint, Jason.encode!(body), decode_opts(opts)) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, Jason.decode!(body)}

      {:error, %HTTPoison.Error{reason: :nxdomain}} ->
        {:error, :invalid_endpoint}

      error ->
        error
    end
  end

  defp decode_opts(opts),
    do: decode_opts(opts, [])

  defp decode_opts([{:auth, auth} | rest], acc),
    do: decode_opts(rest, [{"Authorization", auth} | acc])

  defp decode_opts([], acc),
    do: [{"Content-Type", "application/json"} | acc]
end
