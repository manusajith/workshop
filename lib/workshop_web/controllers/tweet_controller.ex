defmodule WorkshopWeb.TweetController do
  use WorkshopWeb, :controller
  alias Workshop.Timeline
  alias WorkshopWeb.TweetIndexSchema

  action_fallback WorkshopWeb.FallbackController

  def index(conn, params) do
    changeset = TweetIndexSchema.changeset(params)

    with {:ok, post_params} <- TweetIndexSchema.to_map(changeset) do
      posts = Timeline.list_tweets(post_params)
      json(conn, Enum.map(posts, &%{body: &1.body}))
    end
  end

  def create(conn, params) do
    with {:ok, params} <- Map.fetch(params, "tweet"),
         {:ok, post} <- Timeline.post_tweet(params) do
      json(conn, %{id: post.id})
    end
  end

  def show(conn, params) do
  end

  def update(conn, params) do
  end

  def delete(conn, params) do
  end
end
