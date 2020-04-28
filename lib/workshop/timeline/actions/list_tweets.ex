defmodule Workshop.Timeline.Actions.ListTweets do
  @moduledoc """
  The "Action" module for listing the Tweets
  """

  @type opt :: {:only_latest, boolean}
  @type opts :: [opt]
  @type result :: [Post.t()]

  @spec call(opts) :: result
  def call(opts) do
    only_latest = opts[:only_latest]
    posts = Posts.list_posts()

    if only_latest do
      Enum.take(posts, 5)
    else
      posts
    end
  end
end
