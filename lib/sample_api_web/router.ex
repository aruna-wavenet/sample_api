defmodule SampleApiWeb.Router do
  use SampleApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SampleApiWeb do
    pipe_through :api

    resources "/user", UserController, except: [:new, :edit]
  end
end
