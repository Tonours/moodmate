defmodule Moodmate.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Moodmate.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "test@example.com",
        password: "password123",
        username: "testuser"
      })
      |> Moodmate.Accounts.create_user()

    user
  end
end
