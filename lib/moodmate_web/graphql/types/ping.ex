defmodule MoodmateWeb.GraphQL.Types.Ping do
  use Absinthe.Schema.Notation

  object :ping do
    field :message, non_null(:string)
  end
end
