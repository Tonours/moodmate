defmodule MoodmateWeb.Graphql.Subscriptions.Ping.PingSubscriptions do
  use Absinthe.Schema.Notation

  object :ping_subscription do
    field :ping, :ping do
      config fn _args, _info ->
        {:ok, topic: "ping:lobby"}
      end
    end

    field :shout, :shout do
      config fn _args, _info ->
        {:ok, topic: "shout:lobby"}
      end
    end
  end
end
