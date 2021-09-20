defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  @spec start_game :: list
  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to Continue")
    hero_choice()
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and found the exit")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end
end
