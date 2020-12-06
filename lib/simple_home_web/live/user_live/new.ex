defmodule SimpleHomeWeb.UserLive.New do
  @moduledoc false
  use SimpleHomeWeb, :live_view

  alias SimpleHome.Accounts
  alias SimpleHome.Accounts.User

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :changeset, Accounts.change_user(%User{}))}
  end

  def render(assigns) do
    SimpleHomeWeb.UserView.render("new.html", assigns)
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      %User{}
      |> Accounts.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    user_params
    |> Accounts.create_user()
    |> case do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> redirect(to: Routes.page_path(socket, :index))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
