defmodule MoodmateWeb.GraphQL.Subscriptions.Ping do
  use Absinthe.Schema.Notation

  object :ping_subscriptions do
    field :pinged, :ping do
      config fn _args, _info ->
        {:ok, topic: "ping"}
      end
    end
  end
end
