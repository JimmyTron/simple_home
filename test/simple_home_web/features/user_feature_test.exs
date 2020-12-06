defmodule SimpleHomeWeb.Features.UserTest do
  use SimpleHomeWeb.FeatureCase

  alias SimpleHome.Accounts.User

  test "user succefully creates account", %{session: session} do
    session
    |> visit("/users/new")
    |> fill_in(text_field("First name"), with: "Jane")
    |> fill_in(text_field("Last name"), with: "Doe")
    |> fill_in(text_field("Email"), with: "jane@doe.com")
    |> fill_in(text_field("Password"), with: "@2h-Qu8_W")
    |> fill_in(text_field("user[password_confirmation]"), with: "@2h-Qu8_W")
    |> click(button('Save'))
    # |> assert_has(css(".alert-info", text: "User created successfully"))

    assert current_path(session) == "/"

    assert %User{} = Repo.get_by!(User, first_name: "Jane")
  end

  test "user  with invalid attribute cannot create an  account", %{session: session} do
    session
    |> visit("/users/new")
    |> fill_in(text_field("First name"), with: "")
    |> click(button('Save'))

    assert current_path(session) == "/users/new"
  end
end
