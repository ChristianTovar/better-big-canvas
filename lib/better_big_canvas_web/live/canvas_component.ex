defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  alias BetterBigCanvas.Square

  def update(%{parent_id: parent_id, id: id} = assigns, socket) do
    current_color =
      parent_id
      |> String.to_integer()
      |> Square.read()
      |> Keyword.get(String.to_atom("#{id}"))

    updated_assigns = Map.put(assigns, :color, current_color)

    {:ok, assign(socket, updated_assigns)}
  end

  def render(%{color: color} = assigns) do
    ~L"""
    <div class="board canvas-square" phx-click="clicked" phx-target=<%= @myself %> style=<%= "background-color:#{color};" %></div>
    """
  end

  def handle_event(
        "clicked",
        _params,
        %{assigns: %{pickr_color: new_color, parent_id: id}} = socket
      ) do
    new_data =
      id
      |> String.to_integer()
      |> Square.read()
      |> Keyword.replace!(String.to_atom("#{socket.assigns.id}"), new_color)

    Square.update(String.to_integer(id), new_data)

    {:noreply, assign(socket, color: new_color)}
  end
end
