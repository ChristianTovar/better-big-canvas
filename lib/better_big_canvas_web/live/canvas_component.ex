defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  alias BetterBigCanvas.Square

  def update(assigns, socket) do
    current_color = get_current_color(assigns)

    {:ok, assign(socket, Map.put(assigns, :color, current_color))}
  end

  def render(assigns) do
    ~L"""
    <div id="<% @id %>" class="board canvas-square" phx-hook="OnClick" phx-target=<%= @myself %> style=<%= "background-color:#{@color};" %>></div>
    """
  end

  def handle_event("click", _, %{assigns: assigns} = socket) do
    update_color(assigns)

    {:noreply, assign(socket, color: assigns.pickr_color)}
  end

  defp get_canvas_data(id) do
    id
    |> String.to_integer()
    |> Square.read()
  end

  defp get_current_color(%{parent_id: parent_id, id: id}) do
    parent_id
    |> get_canvas_data()
    |> Keyword.get(String.to_atom("#{id}"))
  end

  defp update_color(%{pickr_color: new_color, parent_id: parent_id, id: id}) do
    parent_id
    |> get_canvas_data()
    |> Keyword.replace!(String.to_atom("#{id}"), new_color)
    |> Square.update(String.to_integer(parent_id))

    Phoenix.PubSub.broadcast(BetterBigCanvas.PubSub, "update", %{id: String.to_integer(parent_id)})
  end
end
