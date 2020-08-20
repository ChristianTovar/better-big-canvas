defmodule BetterBigCanvasWeb.CanvasView do
  use BetterBigCanvasWeb, :view

  @spec row_enumerable :: [non_neg_integer()]
  def row_enumerable, do: Enum.map(0..29, &(&1 * 30))
end
