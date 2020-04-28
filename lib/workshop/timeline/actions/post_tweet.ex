defmodule Workshop.Timeline.Actions.PostTweet do
  @moduledoc """
  The "Action" module for posting Tweets
  """

  @type params :: %{
    body: String.t(),
    username: String.t(),
    likes: non_neg_integer,
    published: boolean
  }

  @type result :: {:ok, Post.t()} | {:error, Ecto.Changeset.t()}

  @spec call(params) :: result
  def call(params) do
    Posts.create_post(params)
  end
end
