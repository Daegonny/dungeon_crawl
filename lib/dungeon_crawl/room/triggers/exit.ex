defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger
  @spec run(any, any) :: {any, :exit}
  def run(chracter, _), do: {chracter, :exit}
end
