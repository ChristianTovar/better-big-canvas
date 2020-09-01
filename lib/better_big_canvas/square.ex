defmodule BetterBigCanvas.Square do
  require Amnesia
  require Amnesia.Helper
  require Exquisite
  require Database.Square

  alias Database.Square

  @board_range 1..400
  @canvas_range 0..899
  @white "#FFFFFF"

  def update(data, id) do
    Amnesia.transaction do
      Square.write(%Square{data: data, id: id})
    end
  end

  def read(id) do
    Amnesia.transaction do
      id
      |> Square.read()
      |> Map.get(:data)
    end
  end

  def populate do
    Enum.each(@board_range, fn id ->
      Amnesia.transaction do
        Square.write(%Square{id: id, data: set_data()})
      end
    end)
  end

  defp set_data, do: Enum.map(@canvas_range, &{String.to_atom("#{&1}"), @white})
end
