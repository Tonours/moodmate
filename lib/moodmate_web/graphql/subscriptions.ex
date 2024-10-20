defmodule MoodmateWeb.GraphQL.Subscriptions do
  use Absinthe.Schema.Notation

  alias MoodmateWeb.GraphQL.Subscriptions

  import_types Subscriptions.Ping
end
