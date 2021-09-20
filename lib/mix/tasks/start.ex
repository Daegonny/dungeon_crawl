defmodule Mix.Tasks.Start do
  use Mix.Task

  @spec run(any) :: :ok
  def run(_), do: DungeonCrawl.CLI.Main.start_game()
end
