defmodule SimpleHomeWeb.UserLiveTest do
  use SimpleHomeWeb.ConnCase
  import Phoenix.LiveViewTest
  alias SimpleHome.Accounts.User

  @create_attrs %{
    email: "janedoe@example.com",
    first_name: "Jane",
    last_name: "Doe",
    password: "Some@password1",
    password_confirmation: "Some@password1"
  }
  test "saves new user", %{conn: conn} do
    {:ok, index_live, _html} = live(conn, Routes.user_new_path(conn, :new))

    {:ok, %Plug.Conn{resp_body: resp_body}} =
      index_live
      |> form("#user-form", user: @create_attrs)
      |> render_submit()
      |> follow_redirect(conn, Routes.page_path(conn, :index))

    assert resp_body =~ "User created successfully"
    assert %User{} = SimpleHome.Repo.get_by!(User, first_name: "Jane")
  end

  test "user with invalid attrs not created", %{conn: conn} do
    {:ok, index_live, _html} = live(conn, Routes.user_new_path(conn, :new))

    assert index_live
           |> form("#user-form", user: %{})
           |> render_change() =~ "can&apos;t be blank"
  end
end
