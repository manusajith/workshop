defmodule Workshop.Timeline do
  alias WorkshopStorage.Posts
  alias Workshop.Timeline.Actions.{PostTweet, ListTweets}

  @spec post_tweet(PostTweet.params()) :: PostTweet.result()
  def post_tweet(params) do
    PostTweet.call(params)
  end

  @spec list_tweets(ListTweets.opts()) :: ListTweets.result()
  def list_tweets(opts \\ []) do
    ListTweets.call(opts)
  end
end
