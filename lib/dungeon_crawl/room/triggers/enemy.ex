defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Battle

  def run(character, %Action{id: :forward}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepared and attack first.")
    {updated_char, _enemy} = Battle.fight(character, enemy)
    {updated_char, :forward}
  end
end
