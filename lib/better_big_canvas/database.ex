use Amnesia

defdatabase Database do
  deftable(
    Square,
    [{:id, autoincrement}, :data],
    type: :ordered_set
  )
end
