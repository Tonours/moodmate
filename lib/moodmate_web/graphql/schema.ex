defmodule MoodmateWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom

  def context(ctx) do
    Map.put(ctx, :pubsub, MoodmateWeb.Endpoint)
  end

  query do
    field :ping, :string do
      resolve(fn _, _ ->
        # Send a message to the subscription pinged topic
        Absinthe.Subscription.publish(MoodmateWeb.Endpoint, "pong", pinged: "*")
        {:ok, "pong"}
      end)
    end
  end

  subscription do
    field :pinged, :string do
      config(fn _, _ ->
        {:ok, topic: "*"}
      end)
    end
  end
end
