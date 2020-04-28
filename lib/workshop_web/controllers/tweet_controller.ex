defmodule WorkshopWeb.TweetController do
  use WorkshopWeb, :controller
  alias Workshop.Timeline
  alias WorkshopWeb.TweetIndexSchema

  action_fallback WorkshopWeb.FallbackController

  def index(conn, params) do
    changeset = TweetIndexSchema.changeset(params)

    with {:ok, tweet_params} <- TweetIndexSchema.to_map(changeset) do
      tweets = Timeline.list_tweets(tweet_params)
      render(conn, "index.json", tweets: tweets)
    end
  end

  def create(conn, params) do
    # TODO: Replace Map.fetch with our own helper that returns something other than a generic :error
    with {:ok, tweet_params} <- Map.fetch(params, "data"),
         {:ok, tweet} <- Timeline.post_tweet(tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def show(conn, params) do
  end

  def update(conn, params) do
  end

  def delete(conn, params) do
  end
end
