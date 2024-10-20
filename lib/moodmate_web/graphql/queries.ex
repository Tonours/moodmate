defmodule MoodmateWeb.GraphQL.Queries do
  use Absinthe.Schema.Notation

  alias MoodmateWeb.GraphQL.Queries

  import_types Queries.Ping
  import_types Queries.Session
end
