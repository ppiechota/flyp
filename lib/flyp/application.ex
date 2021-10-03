defmodule Flyp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Flyp.Repo,
      # Start the Telemetry supervisor
      FlypWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Flyp.PubSub},
      # Start the Endpoint (http/https)
      FlypWeb.Endpoint
      # Start a worker by calling: Flyp.Worker.start_link(arg)
      # {Flyp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Flyp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FlypWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
