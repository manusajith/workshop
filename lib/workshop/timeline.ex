defmodule Workshop.Timeline do
  alias WorkshopStorage.Posts

  @type post_params :: %{
          body: String.t(),
          username: String.t(),
          likes: non_neg_integer,
          published: boolean
        }

  @type list_tweets_opt :: {:only_latest, boolean}

  @spec post_tweet(post_params) :: {:ok, Post.t()} | {:error, Ecto.Changeset.t()}
  def post_tweet(params) do
    Posts.create_post(params)
  end

  @spec list_tweets([list_tweets_opt]) :: [Post.t()]
  def list_tweets(opts \\ []) do
    only_latest = opts[:only_latest]
    posts = Posts.list_posts()

    if only_latest do
      Enum.take(posts, 5)
    else
      posts
    end
  end
end
