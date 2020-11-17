defmodule SimpleHomeWeb.Integrations.IndexPageTest do
  use SimpleHome.IntegrationCase, async: true

  test "Basic page flow", %{conn: conn} do
    get(conn, Routes.page_path(conn, :index))
    |> assert_response(status: 200, path: Routes.page_path(conn, :index))
  end
end
