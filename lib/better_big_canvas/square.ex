defmodule BetterBigCanvas.Square do
  require Amnesia
  require Amnesia.Helper
  require Exquisite
  require Database.Square

  alias Database.Square

  @board_range 0..399
  @canvas_range 0..899
  @white "#FFFFFF"

  def update(id, data) do
    Amnesia.transaction do
      Square.write(%Square{id: id, data: data})
    end
  end

  def read(id) do
    Amnesia.transaction do
      Square.read(id)
    end
  end

  def populate do
    Enum.each(@board_range, fn id ->
      Amnesia.transaction do
        Square.write(%Square{id: id, data: set_data()})
      end
    end)
  end

  defp set_data do
    @canvas_range
    |> Enum.map(&{&1, @white})
    |> Enum.into(%{})
  end
end