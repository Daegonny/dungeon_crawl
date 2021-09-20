defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct label: nil,
            id: nil

  @spec forward :: %DungeonCrawl.Room.Action{id: :forward, label: <<_::104>>}
  def forward, do: %Action{id: :forward, label: "Move forward."}
  @spec rest :: %DungeonCrawl.Room.Action{id: :rest, label: <<_::224>>}
  def rest, do: %Action{id: :rest, label: "Take a better look and rest."}
  @spec search :: %DungeonCrawl.Room.Action{id: :search, label: <<_::128>>}
  def search, do: %Action{id: :search, label: "Search the room."}
end
