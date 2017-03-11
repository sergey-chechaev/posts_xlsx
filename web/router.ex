defmodule PostsXlsx.Router do
  use PostsXlsx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PostsXlsx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController
  end

  scope "/exports", as: :exports, alias: PostsXlsx.Exports do
    pipe_through :browser

    resources "/posts", PostController, only: [:index]
  end
end
