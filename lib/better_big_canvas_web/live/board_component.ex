defmodule BetterBigCanvasWeb.BoardComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div>
      <canvas id="<%= @id %>" class="board board-square"  phx-click="clicked" phx-target="<%= @myself %>" phx-hook="Canvas" width="30" height="30" data-version="<%= @version %>"></canvas>
    </div>
    """
  end

  def handle_event("clicked", _, socket),
    do: {:noreply, push_redirect(socket, to: "/#{socket.assigns.id}")}
end
