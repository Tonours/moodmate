defmodule MoodmateWeb.GraphQL.Mutations do
  use Absinthe.Schema.Notation

  alias MoodmateWeb.GraphQL.Mutations

  import_types Mutations.Session
end
