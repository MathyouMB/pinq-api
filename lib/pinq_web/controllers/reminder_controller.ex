defmodule PinqWeb.ReminderController do
  use PinqWeb, :controller

  alias Pinq.Reminders
  alias Pinq.Reminders.Reminder

  action_fallback PinqWeb.FallbackController

  def index(conn, _params) do
    reminders = Reminders.list_reminders()
    render(conn, "index.json", reminders: reminders)
  end

  def create(conn, %{"reminder" => reminder_params}) do
    with {:ok, %Reminder{} = reminder} <- Reminders.create_reminder(reminder_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.reminder_path(conn, :show, reminder))
      |> render("show.json", reminder: reminder)
    end
  end

  def show(conn, %{"id" => id}) do
    reminder = Reminders.get_reminder!(id)
    render(conn, "show.json", reminder: reminder)
  end

  def update(conn, %{"id" => id, "reminder" => reminder_params}) do
    reminder = Reminders.get_reminder!(id)

    with {:ok, %Reminder{} = reminder} <- Reminders.update_reminder(reminder, reminder_params) do
      render(conn, "show.json", reminder: reminder)
    end
  end

  def delete(conn, %{"id" => id}) do
    reminder = Reminders.get_reminder!(id)

    with {:ok, %Reminder{}} <- Reminders.delete_reminder(reminder) do
      send_resp(conn, :no_content, "")
    end
  end
end
