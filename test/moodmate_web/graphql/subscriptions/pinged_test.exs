defmodule MoodmateWeb.GraphQL.Subscriptions.PingedTest do
  use MoodmateWeb.SubscriptionCase, async: true

  @ping_query """
    {
      ping
    }
  """

  describe "when subscribe to pinged" do
    test "it should return pong after a ping query", %{socket: socket} do
      subscription = """
        subscription {
          pinged
        }
      """

      # setup
      ref = push_doc(socket, subscription)
      assert_reply ref, :ok, %{subscriptionId: subscription_id}
      conn = build_conn()

      conn =
        post(conn, "/api/graphql", %{
          "query" => @ping_query
        })

      # no need to check pong result, we already did in previous test
      # assert subscription has been sent to us
      expected = %{
        result: %{
          data: %{
            "pinged" => "pong"
          }
        },
        subscriptionId: subscription_id
      }

      assert_push "subscription:data", push
      assert expected == push
    end
  end
end
