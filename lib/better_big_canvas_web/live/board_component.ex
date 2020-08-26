defmodule BetterBigCanvasWeb.BoardComponent do
  use Phoenix.LiveComponent

  alias BetterBigCanvas.Square

  def render(assigns) do
    ~L"""
    <canvas id="<%= @id %>" class="board board-square" phx-hook="Canvas" phx-click="clicked" phx-target="<%= @myself %>" data-pixels="<%= get_pixels(@id) %>" width="30" height="30"></canvas>
    """
  end

  def handle_event("clicked", _, socket),
    do: {:noreply, push_redirect(socket, to: "/#{socket.assigns.id}")}

  defp get_pixels(id) do
    id
    |> Square.read()
    |> Keyword.values()
    |> Jason.encode!()
  end
end
