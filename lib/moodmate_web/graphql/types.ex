defmodule MoodmateWeb.GraphQL.Types do
  use Absinthe.Schema.Notation

  alias MoodmateWeb.GraphQL.Types

  import_types Types.Ping
  import_types Types.Session
  import_types Types.User
end
