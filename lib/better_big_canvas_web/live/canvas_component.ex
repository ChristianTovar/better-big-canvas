defmodule BetterBigCanvasWeb.CanvasComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="board board-square"></div>
    """
  end
end
