defmodule MoodmateWeb.GraphQL.Resolvers.User do
  alias Moodmate.Accounts
  alias MoodmateWeb.GraphQL
  alias MoodmateWeb.AuthToken

  def signup(args, _context) do
    case Accounts.create_user(args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create an account",
          details: GraphQL.ChangesetErrors.error_details(changeset)
        }

      {:ok, user} ->
        token = AuthToken.sign(user)
        {:ok, %{user: user, token: token}}
    end
  end

  def signin(%{email: email, password: password}, _context) do
    case Accounts.authenticate(email, password) do
      :error ->
        {
          :error,
          message: "Unable to authenticate the user",
          details: %{"signin" => ["Invalid email or password"]}
        }

      {:ok, %Accounts.User{} = user} ->
        {:ok, %{token: AuthToken.sign(user), user: %{email: user.email, username: user.username}}}
    end
  end

  def me(_, _, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end
end
