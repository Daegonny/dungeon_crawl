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

  @spec generate_question(list()) :: String.t()
  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]\n"
  end

  @spec ask_for_option(list) :: any
  def ask_for_option(options) do
    index = ask_for_index(options)
    chosen_option = Enum.at(options, index)

    case chosen_option do
      nil ->
        display_invalid_option()
        ask_for_option(options)

      chosen_option ->
        chosen_option
    end
  end

  @spec ask_for_index(list) :: integer
  def ask_for_index(options) do
    answer =
      options
      |> display_options()
      |> generate_question
      |> Shell.prompt()
      |> Integer.parse()

    case answer do
      :error ->
        display_invalid_option()
        ask_for_index(options)

      {option, _} ->
        option - 1
    end
  end

  defp display_invalid_option do
    Shell.cmd("clear")
    Shell.error("Invalid option.")
    Shell.prompt("Press Enter to try again.")
    Shell.cmd("clear")
  end
end
