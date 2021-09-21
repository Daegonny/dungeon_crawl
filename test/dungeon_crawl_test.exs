defmodule DungeonCrawlTest do
  use ExUnit.Case
  alias DungeonCrawl.Character
  doctest DungeonCrawl

  @hero %Character{hit_points: 10, max_hit_points: 15}

  test "greets the world" do
    assert DungeonCrawl.hello() == :world
  end

  test "hero takes damage" do
    initial_hit_points = @hero.hit_points
    %Character{hit_points: hit_points} = Character.take_damage(@hero, 3)
    assert hit_points == initial_hit_points - 3
  end

  test "hero hit_points dont go under zero" do
    %Character{hit_points: hit_points} = Character.take_damage(@hero, 10)
    assert hit_points == 0
  end

  test "hero heals damage" do
    initial_hit_points = @hero.hit_points
    %Character{hit_points: hit_points} = Character.heal(@hero, 3)
    assert hit_points == initial_hit_points + 3
  end

  test "hero hit_points dont go over max_hit_points" do
    %Character{hit_points: hit_points, max_hit_points: max_hit_points} =
      @hero
      |> Character.heal(35)

    assert hit_points == max_hit_points
  end
end
