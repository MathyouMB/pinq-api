defmodule PinqWeb.ReminderView do
  use PinqWeb, :view
  alias PinqWeb.ReminderView

  def render("index.json", %{reminders: reminders}) do
    %{data: render_many(reminders, ReminderView, "reminder.json")}
  end

  def render("show.json", %{reminder: reminder}) do
    %{data: render_one(reminder, ReminderView, "reminder.json")}
  end

  def render("reminder.json", %{reminder: reminder}) do
    %{id: reminder.id,
      name: reminder.name,
      description: reminder.description,
      status: reminder.status,
      time: reminder.time}
  end
end
