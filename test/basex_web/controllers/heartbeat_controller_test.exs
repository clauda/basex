defmodule BasexWeb.HeartbeatControllerTest do
  use BasexWeb.ConnCase

  @moduletag :controllers

  describe "status/0" do
    test "responds with status code 200", %{conn: conn} do
      conn = get(conn, Routes.heartbeat_path(conn, :status))
      assert json_response(conn, 200)["status"] =~ "beating..."
    end
  end
end
