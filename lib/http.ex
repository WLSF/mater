defmodule Mater.HTTP do
  @moduledoc """
  HTTP Client interface to communicate with GraphQL APIs.
  """

  alias Mater.HTTP.Poison

  def call(endpoint, body, opts),
    do: client().call(endpoint, body, opts)

  defp client do
    Poison
  end
end
