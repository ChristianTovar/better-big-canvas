defmodule BetterBigCanvasWeb.CanvasLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  alias BetterBigCanvasWeb.CanvasView

  @impl true
  def render(assigns), do: Phoenix.View.render(CanvasView, "canvas_live.html", assigns)

  @impl true
  def mount(_params, _session, socket), do: {:ok, socket}
end
