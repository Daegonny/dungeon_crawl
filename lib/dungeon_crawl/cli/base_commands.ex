defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  @spec display_options(list) :: list()
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  @spec generate_question(any) :: <<_::64, _::_*8>>
  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]\n"
  end

  @spec parse_answer(binary) :: integer
  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
end
