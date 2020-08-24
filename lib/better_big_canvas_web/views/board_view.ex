defmodule BetterBigCanvasWeb.BoardView do
  use BetterBigCanvasWeb, :view

  @spec row_enumerable :: [non_neg_integer()]
  def row_enumerable, do: Enum.map(0..19, &(&1 * 20))
end
