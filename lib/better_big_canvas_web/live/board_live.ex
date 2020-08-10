defmodule BetterBigCanvasWeb.BoardLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  alias BetterBigCanvasWeb.BoardView

  @impl true
  def render(assigns), do: Phoenix.View.render(BoardView, "board_live.html", assigns)

  @impl true
  def mount(_params, _session, socket), do: {:ok, socket}
end
