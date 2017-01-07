defmodule Ratingpeople.Router do
  use Ratingpeople.Web, :router

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

  scope "/", Ratingpeople do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/vote", PageController, :vote
    resources "/users", UserController
    resources "/ratings", RatingController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Ratingpeople do
  #   pipe_through :api
  # end
end
