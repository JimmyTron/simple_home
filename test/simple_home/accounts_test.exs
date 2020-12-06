defmodule SimpleHome.AccountsTest do
  use SimpleHome.DataCase

  alias SimpleHome.Accounts

  describe "users" do
    alias SimpleHome.Accounts.User

    @valid_attrs %{
      email: "janedoe@example.com",
      first_name: "some first_name",
      last_name: "some last_name",
      password: "Some@password1",
      password_confirmation: "Some@password1"
    }

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password: nil}
    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "janedoe@example.com"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
