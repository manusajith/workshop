defmodule WorkshopStorage.Posts do
  @moduledoc """
  Posts context
  """

  alias WorkshopStorage.Posts.Post
  alias WorkshopStorage.Repo

  @spec list_posts :: any
  def list_posts do
    Repo.all(Post)
  end

  def create_post(params) do
    %Post{}
    |> Post.changeset(params)
    |> Repo.insert()
  end
end
