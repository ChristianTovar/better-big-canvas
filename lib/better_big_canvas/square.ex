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

  def create_and_populate do
    :mnesia.stop()
    :mnesia.delete_schema([node()])
    :mnesia.create_schema([node()])
    :mnesia.start()
    :mnesia.create_table(Square, attributes: [:id, :data], disc_only_copies: [node()])

    Enum.each(@board_range, &update(set_data(), &1))
  end

  defp set_data, do: Enum.map(@canvas_range, &{String.to_atom("#{&1}"), @white})
end
