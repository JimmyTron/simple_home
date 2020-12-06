defmodule SimpleHomeWeb.FeatureCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL
      alias SimpleHome.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Wallaby.Query
      import Wallaby.Browser
      alias SimpleHomeWeb.Router.Helpers, as: Routes
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SimpleHome.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(SimpleHome.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(SimpleHome.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
