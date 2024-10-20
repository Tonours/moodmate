defmodule MoodmateWeb.GraphQL.Resolvers.Ping do
  alias Absinthe.Subscription

  def get_ping(_, _) do
    response = %{message: "pong"}
    Subscription.publish(MoodmateWeb.Endpoint, response, pinged: "ping")
    {:ok, response}
  end

  def resolve_ping_subscription(_, %{message: message}, _) do
    {:ok, message}
  end
end
