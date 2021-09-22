defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Action
  import DungeonCrawl.CLI.BaseCommands

  @spec start(Room.t()) :: {Room.t(), Action.t()}
  def(start(room)) do
    room_actions = room.actions

    Shell.info(room.description)

    chosen_action =
      room_actions
      |> ask_for_option()

    {room, chosen_action}
  end
end
