defmodule PinqWeb.Router do
  use PinqWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :csrf do
    plug :protect_from_forgery # to here
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", PinqWeb do
    pipe_through [:browser, :csrf] # Use both browser and csrf pipelines
    get "/", PageController, :index
  end

  scope "/", PinqWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/reminders", ReminderController
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:browser, :csrf]
      live_dashboard "/dashboard", metrics: PinqWeb.Telemetry
    end
  end
end
