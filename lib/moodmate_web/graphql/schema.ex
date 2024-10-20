defmodule MoodmateWeb.GraphQL.Schema do
  use Absinthe.Schema

  alias MoodmateWeb.GraphQL

  import_types Absinthe.Type.Custom
  import_types GraphQL.Mutations
  import_types GraphQL.Queries
  import_types GraphQL.Subscriptions
  import_types GraphQL.Types

  def context(ctx) do
    Map.put(ctx, :pubsub, MoodmateWeb.Endpoint)
  end

  query do
    import_fields :ping_queries
    import_fields :session_queries
  end

  mutation do
    import_fields :session_mutations
  end

  subscription do
    import_fields :ping_subscriptions
  end
end
