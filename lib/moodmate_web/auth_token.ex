defmodule MoodmateWeb.AuthToken do
  @salt Application.compile_env(:moodmate, MoodmateWeb.Endpoint)[:auth_token_salt]

  def sign(user) do
    Phoenix.Token.sign(MoodmateWeb.Endpoint, @salt, %{id: user.id})
  end

  def verify(token) do
    Phoenix.Token.verify(MoodmateWeb.Endpoint, @salt, token, max_age: 60 * 60 * 24)
  end
end
