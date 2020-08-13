defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="board board-square" phx-click="clicked" phx-target=<%= @myself %>></div>
    """
  end

  def handle_event("clicked", _, socket) do
    IO.inspect("hey")

    {:noreply, socket}
  end
end
