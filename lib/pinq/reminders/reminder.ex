defmodule Pinq.Reminders.Reminder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reminders" do
    field :description, :string
    field :name, :string
    field :status, :string
    field :time, :naive_datetime
    belongs_to :user, Pinq.Reminders.User

    timestamps()
  end

  @doc false
  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, [:name, :description, :status, :time])
    |> validate_required([:name, :description, :status, :time])
  end
end
