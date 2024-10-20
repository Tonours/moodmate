defmodule MoodmateWeb.GraphQL.Mutations.SigninTest do
  use MoodmateWeb.ConnCase, async: true

  @query """
    mutation($email: String!, $password: String!) {
      signin(email: $email, password: $password) {
        token
        user {
          email
          username
        }
      }
    }
  """

  describe "when signin" do
    test "it should return user token, email and username", %{conn: conn} do
      user_attrs = %{
        username: "smokey",
        email: "smokey@bear.com",
        password: "secretSmokey"
      }

      assert {:ok, user} = Moodmate.Accounts.create_user(user_attrs)

      input = %{
        email: user_attrs[:email],
        password: user_attrs[:password]
      }

      conn =
        post(conn, "/api/graphql", %{
          query: @query,
          variables: input
        })

      assert %{
               "data" => %{
                 "signin" => session
               }
             } = json_response(conn, 200)

      assert %{
               "token" => token,
               "user" => user_data
             } = session

      assert %{"username" => user.username, "email" => user.email} == user_data

      assert {:ok, %{id: user.id}} ==
               MoodmateWeb.AuthToken.verify(token)
    end
  end
end
