defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="board board-square" phx-click="clicked" phx-target=<%= @myself %>></div>
    """
  end

  def handle_event("clicked", _, %{assigns: %{myself: id}} = socket),
    do: {:noreply, push_redirect(socket, to: "/#{id}")}
end
