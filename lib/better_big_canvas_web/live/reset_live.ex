defmodule BetterBigCanvasWeb.ResetLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  alias BetterBigCanvas.Square

  @impl true
  def mount(_params, _session, socket) do
    Square.create_and_populate()

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~L"""
      <h1>Canvas Reset!</h1>
    """
  end
end
