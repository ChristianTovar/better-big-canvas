defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  def mount(socket), do: {:ok, assign(socket, color: "white")}

  def render(%{color: color} = assigns) do
    ~L"""
    <div class="board board-square" phx-click="clicked" phx-target=<%= @myself %> style=<%= "background-color:#{color};" %></div>
    """
  end

  def handle_event("clicked", _params, %{assigns: %{pickr_color: new_color}} = socket),
    do: {:noreply, assign(socket, color: new_color)}
end
