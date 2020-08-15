defmodule BetterBigCanvasWeb.CanvasLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  alias BetterBigCanvasWeb.CanvasView

  @impl true
  def mount(_params, _session, socket), do: {:ok, assign(socket, pickr_color: "white")}

  @impl true
  def render(assigns), do: Phoenix.View.render(CanvasView, "canvas_live.html", assigns)

  @impl true
  def handle_event("select-color", %{"color" => new_color}, socket),
    do: {:noreply, assign(socket, pickr_color: new_color)}
end
