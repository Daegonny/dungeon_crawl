defmodule DungeonCrawl.Character do
  @type t :: %DungeonCrawl.Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer,
          max_hit_points: non_neg_integer,
          attack_description: String.t(),
          damage_range: Range.t()
        }

  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  defimpl String.Chars do
    @spec to_string(DungeonCrawl.Character.t()) :: String.t()
    def to_string(character), do: character.name
  end

  @spec take_damage(DungeonCrawl.Character.t(), number()) :: DungeonCrawl.Character.t()
  def take_damage(character, damage) do
    function = fn char -> max(0, char.hit_points - damage) end
    update_hit_points(character, function)
  end

  @spec heal(DungeonCrawl.Character.t(), number()) :: DungeonCrawl.Character.t()
  def heal(character, healing_value) do
    function = fn char -> min(char.hit_points + healing_value, char.max_hit_points) end
    update_hit_points(character, function)
  end

  defp update_hit_points(character, function) do
    new_hit_points = function.(character)
    %{character | hit_points: new_hit_points}
  end

  @spec current_stats(DungeonCrawl.Character.t()) :: String.t()
  def current_stats(character),
    do: "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points}"
end
