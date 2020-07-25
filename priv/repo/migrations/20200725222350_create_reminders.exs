defmodule Pinq.Repo.Migrations.CreateReminders do
  use Ecto.Migration

  def change do
    create table(:reminders) do
      add :name, :string
      add :description, :text
      add :status, :string
      add :time, :naive_datetime
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:reminders, [:user_id])
  end
end
