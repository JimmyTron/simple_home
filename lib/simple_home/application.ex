defmodule SimpleHome.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SimpleHome.Repo,
      # Start the Telemetry supervisor

      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleHome.PubSub},
      # Start the Endpoint (http/https)
      SimpleHomeWeb.Endpoint
      # Start a worker by calling: SimpleHome.Worker.start_link(arg)
      # {SimpleHome.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleHome.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SimpleHomeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
