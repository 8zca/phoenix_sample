defmodule PhoenixSampleWeb.Router do
  use PhoenixSampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixSampleWeb do
    pipe_through :api
  end
end
