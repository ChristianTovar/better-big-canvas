defmodule BetterBigCanvasWeb.BoardComponent do
  use Phoenix.LiveComponent

  alias BetterBigCanvas.Square

  def render(assigns) do
    pixels =
      assigns.myself
      |> Square.read()
      |> Map.get(:data)
      |> Jason.encode!()

    ~L"""
    <canvas id="<%= @myself%>" class="board board-square" phx-hook="Canvas" phx-click="clicked" phx-target="<%= @myself %>" data-pixels="<%= pixels %>" width="30" height="30"></canvas>
    """
  end

  def handle_event("clicked", _, %{assigns: %{myself: id}} = socket),
    do: {:noreply, push_redirect(socket, to: "/#{id}")}
end
