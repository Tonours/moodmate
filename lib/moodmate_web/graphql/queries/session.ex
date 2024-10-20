defmodule MoodmateWeb.GraphQL.Queries.Session do
  use Absinthe.Schema.Notation

  alias MoodmateWeb.GraphQL.Resolvers
  alias MoodmateWeb.GraphQL.Middlewares

  object :session_queries do
    field :me, :user do
      middleware(Middlewares.Authenticate)
      resolve(&Resolvers.User.me/3)
    end
  end
end
