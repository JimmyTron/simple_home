defmodule SimpleHome.IntegrationCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use SimpleHomeWeb.ConnCase
      use PhoenixIntegration
    end
  end
end
