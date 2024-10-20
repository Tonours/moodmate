defmodule MoodmateWeb.GraphQL.Subscriptions.PingedTest do
  use MoodmateWeb.SubscriptionCase, async: true

  @ping_query """
    {
      ping {
        message
      }
    }
  """

  describe "when subscribe to pinged" do
    test "it should return pong after a ping query", %{socket: socket} do
      subscription = """
        subscription {
          pinged {
            message
          }
        }
      """

      # setup
      ref = push_doc(socket, subscription)
      assert_reply ref, :ok, %{subscriptionId: subscription_id}

      build_conn()
      |> post("/api/graphql", %{
        "query" => @ping_query
      })

      # no need to check pong result, we already did in previous test
      # assert subscription has been sent to us
      expected = %{
        result: %{
          data: %{
            "pinged" => %{
              "message" => "pong"
            }
          }
        },
        subscriptionId: subscription_id
      }

      assert_push "subscription:data", push
      assert expected == push
    end
  end
end
