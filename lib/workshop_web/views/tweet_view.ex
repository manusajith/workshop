defmodule WorkshopWeb.TweetView do
  use WorkshopWeb, :view
  alias __MODULE__

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "data.json", wat: 1)}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "data.json", wat: 1)}
  end

  def render("data.json", %{tweet: tweet, wat: wat}) do
    %{
      username: tweet.username,
      body: tweet.body,
      wat: wat
    }
  end
end
