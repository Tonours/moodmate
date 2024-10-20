defmodule MoodmateWeb.GraphQL.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :email, non_null(:string)
    field :username, non_null(:string)
  end
end
