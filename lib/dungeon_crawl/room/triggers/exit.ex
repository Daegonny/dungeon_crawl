defmodule DungeonCrawl.Room.Triggers.Exit do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  @behaviour DungeonCrawl.Room.Trigger
  @spec run(Character.t(), Action.t()) :: {Character.t(), :exit}
  def run(chracter, _), do: {chracter, :exit}
end
