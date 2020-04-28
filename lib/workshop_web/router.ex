defmodule WorkshopWeb.Router do
  use WorkshopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WorkshopWeb do
    pipe_through :api

    resources "/tweets", TweetController
  end
end
