defmodule MoodmateWeb.GraphQL.Mutations.SignupTest do
  use MoodmateWeb.ConnCase

  @query """
    mutation signup($username: String!, $email: String!, $password: String!) {
      signup(username: $username, email: $email, password: $password) {
        user {
          username
          email
        }
      }
    }
  """

  describe "when mutation signup" do
    test "it should return created user", %{conn: conn} do
      input = %{
        email: "test@example.com",
        username: "testuser",
        password: "password123"
      }

      conn =
        post(conn, "/api/graphql", %{
          query: @query,
          variables: input
        })

      assert %{
               "data" => %{
                 "signup" => %{
                   "user" => %{
                     "username" => "testuser",
                     "email" => "test@example.com"
                   }
                 }
               }
             } = json_response(conn, 200)
    end
  end
end
