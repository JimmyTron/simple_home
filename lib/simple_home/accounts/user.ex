defmodule SimpleHome.Accounts.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    # field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> validate_format(:email, email_regex())
    |> unique_constraint(:email)
    |> validate_confirmation(:password, required: true)
    |> validate_format(:password, password_regex(),
      message:
        "Complexity requirement not met. Length should be at least 8 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character"
    )
    |> validate_format(:last_name, ~r/(\A\D{1,30}\Z)/,
      message: "should not contain integer and at most 30 characters"
    )
    |> validate_format(:first_name, ~r/(\A\D{1,30}\Z)/,
      message: "should not contain integer and at most 30 characters"
    )
  end

  defp email_regex do
    ~r/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  end

  def password_regex do
    ~r/\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z])(?=.*[[:^alnum:]])/x
  end
end
