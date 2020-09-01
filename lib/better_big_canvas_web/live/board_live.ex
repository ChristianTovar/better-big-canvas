defmodule BetterBigCanvasWeb.BoardLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  alias BetterBigCanvasWeb.{BoardView, BoardComponent}

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Phoenix.PubSub.subscribe(BetterBigCanvas.PubSub, "update")

    {:ok, socket}
  end

  @impl true
  def render(assigns), do: Phoenix.View.render(BoardView, "board_live.html", assigns)

  @impl true
  def handle_info(%{id: id}, socket) do
    send_update(BoardComponent, id: id, version: UUID.uuid4())

    {:noreply, socket}
  end
end
