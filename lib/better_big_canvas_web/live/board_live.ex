defmodule BetterBigCanvasWeb.BoardLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  alias BetterBigCanvasWeb.{BoardView, BoardComponent}
  alias BetterBigCanvas.Square

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

  @impl true
  def handle_event("canvas-mounted", %{"id" => id}, socket),
    do: {:noreply, push_event(socket, "pixels", %{id: id, pixels: get_pixels(id)})}

  def handle_event("canvas-ready", %{"id" => id}, socket),
    do: {:noreply, push_event(socket, "new-pixels", %{id: id, pixels: get_pixels(id)})}

  defp get_pixels(id) do
    id
    |> String.to_integer()
    |> Square.read()
    |> Keyword.values()
  end
end
