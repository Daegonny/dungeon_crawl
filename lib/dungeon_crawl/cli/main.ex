defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  require DungeonCrawl.Room

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to Continue")
    hero_choice()
    crawl(DungeonCrawl.Room.all())
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and found the exit")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  defp crawl(rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
  end
end
