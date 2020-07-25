defmodule PinqWeb.UserController do
  use PinqWeb, :controller

  alias Pinq.Reminders
  alias Pinq.Reminders.User

  action_fallback PinqWeb.FallbackController

  def index(conn, _params) do
    users = Reminders.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Reminders.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Reminders.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Reminders.get_user!(id)

    with {:ok, %User{} = user} <- Reminders.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Reminders.get_user!(id)

    with {:ok, %User{}} <- Reminders.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
