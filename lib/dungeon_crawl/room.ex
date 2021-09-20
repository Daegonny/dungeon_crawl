defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room

  import DungeonCrawl.Room.Action
  defstruct description: nil, actions: []

  @spec all :: [%DungeonCrawl.Room{actions: [map, ...], description: <<_::424>>}, ...]
  def all do
    [
      %Room{
        description: "You found a quiet place. Looks safe for a little nap.",
        actions: [forward(), rest()]
      }
    ]
  end
end
