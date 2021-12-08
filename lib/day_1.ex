defmodule Aoc2021.Day1 do

  def read_input() do
    Path.join([:code.priv_dir(:aoc_2021), "input.txt"])
    |> File.stream!([:read_ahead])
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.to_integer/1)
  end

  @spec compare_numbers([pos_integer()]) :: pos_integer()
  def compare_numbers(numbers) do
    numbers
    |> Enum.reduce({0, nil}, fn
      x, {acc, prev} when x <= prev ->
        {acc, x}
      x, {acc, _prev} ->
        {acc + 1, x}
    end)
    |> elem(0)
  end
end
