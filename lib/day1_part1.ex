defmodule Aoc2021.Day1.Part1 do
  alias Aoc2021.Day1

  def run do
    Day1.read_input()
    |> Day1.compare_numbers()
  end
end
