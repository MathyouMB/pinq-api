defmodule Pinq.RemindersTest do
  use Pinq.DataCase

  alias Pinq.Reminders

  describe "users" do
    alias Pinq.Reminders.User

    @valid_attrs %{email: "some email", password: "some password", username: "some username"}
    @update_attrs %{email: "some updated email", password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: nil, password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reminders.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Reminders.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Reminders.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Reminders.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reminders.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Reminders.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Reminders.update_user(user, @invalid_attrs)
      assert user == Reminders.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Reminders.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Reminders.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Reminders.change_user(user)
    end
  end

  describe "reminders" do
    alias Pinq.Reminders.Reminder

    @valid_attrs %{description: "some description", name: "some name", status: "some status", time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{description: "some updated description", name: "some updated name", status: "some updated status", time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{description: nil, name: nil, status: nil, time: nil}

    def reminder_fixture(attrs \\ %{}) do
      {:ok, reminder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reminders.create_reminder()

      reminder
    end

    test "list_reminders/0 returns all reminders" do
      reminder = reminder_fixture()
      assert Reminders.list_reminders() == [reminder]
    end

    test "get_reminder!/1 returns the reminder with given id" do
      reminder = reminder_fixture()
      assert Reminders.get_reminder!(reminder.id) == reminder
    end

    test "create_reminder/1 with valid data creates a reminder" do
      assert {:ok, %Reminder{} = reminder} = Reminders.create_reminder(@valid_attrs)
      assert reminder.description == "some description"
      assert reminder.name == "some name"
      assert reminder.status == "some status"
      assert reminder.time == ~N[2010-04-17 14:00:00]
    end

    test "create_reminder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reminders.create_reminder(@invalid_attrs)
    end

    test "update_reminder/2 with valid data updates the reminder" do
      reminder = reminder_fixture()
      assert {:ok, %Reminder{} = reminder} = Reminders.update_reminder(reminder, @update_attrs)
      assert reminder.description == "some updated description"
      assert reminder.name == "some updated name"
      assert reminder.status == "some updated status"
      assert reminder.time == ~N[2011-05-18 15:01:01]
    end

    test "update_reminder/2 with invalid data returns error changeset" do
      reminder = reminder_fixture()
      assert {:error, %Ecto.Changeset{}} = Reminders.update_reminder(reminder, @invalid_attrs)
      assert reminder == Reminders.get_reminder!(reminder.id)
    end

    test "delete_reminder/1 deletes the reminder" do
      reminder = reminder_fixture()
      assert {:ok, %Reminder{}} = Reminders.delete_reminder(reminder)
      assert_raise Ecto.NoResultsError, fn -> Reminders.get_reminder!(reminder.id) end
    end

    test "change_reminder/1 returns a reminder changeset" do
      reminder = reminder_fixture()
      assert %Ecto.Changeset{} = Reminders.change_reminder(reminder)
    end
  end
end
