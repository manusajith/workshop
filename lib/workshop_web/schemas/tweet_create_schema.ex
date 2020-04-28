defmodule WorkshopWeb.TweetCreateSchema do
  use Ecto.Schema
  import Ecto.Changeset
  alias WorkshopWeb.TweetCreateSchema

  embedded_schema do
    field(:tweet, :map, default: %{})
  end

  def changeset(params) do
    params = params || %{}
    cast(%TweetCreateSchema{}, params, [:tweet])
  end

  def to_map(changeset) do
    if changeset.valid? do
      {:ok, changeset.changes}
    else
      {:error, changeset}
    end
  end
end
