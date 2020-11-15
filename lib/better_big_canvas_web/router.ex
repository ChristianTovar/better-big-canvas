defmodule BetterBigCanvasWeb.Router do
  use BetterBigCanvasWeb, :router

  import Plug.BasicAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BetterBigCanvasWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug :basic_auth,
         Application.compile_env(:better_big_canvas, :basic_auth) ||
           [username: "username", password: "password"]
  end

  scope "/reset", BetterBigCanvasWeb do
    pipe_through [:browser, :protected]

    live "/", ResetLive
  end

  scope "/", BetterBigCanvasWeb do
    pipe_through :browser

    live "/", BoardLive
    live "/:id", CanvasLive
  end
end
