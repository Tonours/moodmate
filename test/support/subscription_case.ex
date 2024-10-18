defmodule MoodmateWeb.SubscriptionCase do
  @moduledoc """
  This module defines the test case to be used by
  subscription tests
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import Plug.Conn
      import Phoenix.ConnTest
      use MoodmateWeb.ChannelCase

      use Absinthe.Phoenix.SubscriptionTest,
        schema: MoodmateWeb.GraphQL.Schema

      setup do
        {:ok, socket} = Phoenix.ChannelTest.connect(MoodmateWeb.UserSocket, %{})
        {:ok, socket} = Absinthe.Phoenix.SubscriptionTest.join_absinthe(socket)

        {:ok, socket: socket}
      end
    end
  end
end
