defmodule WorkshopWeb.TweetIndexSchema do
  use Ecto.Schema
  import Ecto.Changeset
  alias WorkshopWeb.TweetIndexSchema

  embedded_schema do
    field(:only_latest, :boolean, default: false)
  end

  def changeset(params) do
    cast(%TweetIndexSchema{}, params, [:only_latest])
  end

  def to_map(changeset) do
    if changeset.valid? do
      {:ok, changeset.changes}
    else
      {:error, changeset}
    end
  end
end
