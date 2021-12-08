defmodule Aoc2021.Day1.Part2 do
  alias Aoc2021.Day1

  def run do
    Day1.read_input()
    |> process_numbers()
  end

  @spec process_numbers([pos_integer()]) :: pos_integer()
  def process_numbers(numbers) do
    numbers
    |> Enum.to_list()
    |> make_triple_sums([])
    |> Day1.compare_numbers()
  end

  # def do_part2_compare_sums(sums) do
  #   Enum.reduce(sums, {0, nil}, fn
  #     x, {acc, prev} when x > prev ->
  #       {acc + 1, x}
  #     x, {acc, _prev} ->
  #       {acc, x}
  #   end)
  #   |> elem(0)
  # end

  @spec make_triple_sums([pos_integer()], [pos_integer()]) :: [pos_integer()]
  def make_triple_sums([prev, current, next | _] = numbers, sums) do
    make_triple_sums(Enum.drop(numbers, 1), [prev + current + next | sums])
  end

  def make_triple_sums(_, sums), do: Enum.reverse(sums)

  def get_part2_acc(numbers) do
    %{
      prev: Enum.at(numbers, 0),
      sums: [],
      # next: Enum.at(numbers, 2),
      numbers: numbers
    }
  end
end
