defmodule MoodmateWeb.GraphQL.Middlewares.Authenticate do
  def call(resolution, _opts) do
    case resolution.context do
      %{current_user: _} ->
        resolution

      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "Sign-in required!"})
    end
  end
end
