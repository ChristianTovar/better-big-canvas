defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  def render(%{color: color} = assigns) do
    ~L"""
    <div class="board board-square" phx-click="clicked" phx-target=<%= @myself %> style=<%= "background-color:#{color};" %></div>
    """
  end

  def update(assigns, socket) do
    assigns = [
      color: "white"
    ]

    {:ok, assign(socket, assigns)}
  end

  def handle_event("clicked", params, socket) do
    assigns = [
      color: "blue"
    ]

    {:noreply, assign(socket, assigns)}
  end
end
