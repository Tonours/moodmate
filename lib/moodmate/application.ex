defmodule Moodmate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MoodmateWeb.Telemetry,
      Moodmate.Repo,
      {DNSCluster, query: Application.get_env(:moodmate, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Moodmate.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Moodmate.Finch},
      # Start a worker by calling: Moodmate.Worker.start_link(arg)
      # {Moodmate.Worker, arg},
      # Start to serve requests, typically the last entry
      MoodmateWeb.Endpoint,
      {Absinthe.Subscription, MoodmateWeb.Endpoint}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Moodmate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MoodmateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
