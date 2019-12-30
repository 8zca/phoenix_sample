defmodule PhoenixSampleWeb.Router do
  use PhoenixSampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug PhoenixSample.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api", PhoenixSampleWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]

    post "/signup", UserController, :create
    post "/login", SessionController, :create
    post "/logout", SessionController, :delete

  end
end
