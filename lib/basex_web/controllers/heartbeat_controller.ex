defmodule BasexWeb.HeartbeatController do
  @moduledoc """
  A health check system approach
  """
  use BasexWeb, :controller
  action_fallback BasexWeb.FallbackController

  @doc """
  A endpoint to detect health of the service, must be use by a monitoring system
  """
  def status(conn, _params) do
    {:ok, version} = :application.get_key(:basex, :vsn)

    conn
    |> put_status(200)
    |> json(%{status: "beating...", version: List.to_string(version)})
    |> halt()
  end
end
