defmodule MoodmateWeb.GraphQL.Queries.PingTest do
  use MoodmateWeb.ConnCase

  @ping_query """
    {
      ping {
        message
      }
    }
  """

  describe "when query ping" do
    test "it should return pong", %{conn: conn} do
      conn =
        post(conn, "/api/graphql", %{
          "query" => @ping_query
        })

      assert json_response(conn, 200) == %{
               "data" => %{"ping" => %{"message" => "pong"}}
             }
    end
  end
end
