defmodule MoodmateWeb.GraphQL.Queries.Ping do
  use Absinthe.Schema.Notation

  alias MoodmateWeb.GraphQL.Resolvers

  object :ping_queries do
    field :ping, :ping do
      resolve(&Resolvers.Ping.get_ping/2)
    end
  end
end
