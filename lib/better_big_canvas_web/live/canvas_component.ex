defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  alias BetterBigCanvas.Square

  def update(%{parent_id: id} = assigns, %{assigns: %{myself: myself}} = socket) do
    current_color =
      id
      |> String.to_integer()
      |> Square.read()
      |> Map.get(:data)
      |> Map.get(myself)

    updated_assigns = Map.put(assigns, :color, current_color)

    {:ok, assign(socket, updated_assigns)}
  end

  def render(%{color: color} = assigns) do
    ~L"""
    <div class="board board-square" phx-click="clicked" phx-target=<%= @myself %> style=<%= "background-color:#{color};" %></div>
    """
  end

  def handle_event(
        "clicked",
        _params,
        %{assigns: %{pickr_color: new_color, parent_id: id, myself: myself}} = socket
      ) do
    new_data =
      id
      |> String.to_integer()
      |> Square.read()
      |> Map.get(:data)
      |> Map.put(myself, new_color)

    Square.update(String.to_integer(id), new_data)

    {:noreply, assign(socket, color: new_color)}
  end
end
