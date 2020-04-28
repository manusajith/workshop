defmodule WorkshopStorage.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias WorkshopStorage.Posts.Post

  @type t :: %Post{
          username: String.t(),
          body: String.t(),
          likes: non_neg_integer,
          published: boolean,
          inserted_at: DateTime.t(),
          updated_at: DateTime.t()
        }

  schema "posts" do
    field(:username, :string)
    field(:body, :string)
    field(:likes, :integer, default: 0)
    field(:published, :boolean, default: false)
    timestamps()
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:username, :body])
    |> validate_required([:username, :body])
  end
end
