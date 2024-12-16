defmodule AdventDayFour do
  @xmas "XMAS"

  def main(_args) do
    input = IO.read(:stdio, :eof)
    [{width, _}] = Regex.run(~r/\n/, input, return: :index)
    height = input |> String.split(~r/\n/, trim: true) |> Enum.count()

    data =
      input
      |> String.replace(~r{\n}, "")
      |> String.split("", trim: true)
      |> List.to_tuple()

    for y <- 0..(height - 1) do
      for x <- 0..(width - 1) do
        [
          :left,
          :right,
          :up,
          :down,
          :right_up,
          :right_down,
          :left_up,
          :left_down
        ]
        |> Enum.map(&matchesWord?(@xmas, data, x, y, width, height, &1))
        |> Enum.map(&if &1, do: 1, else: 0)
      end
    end
    |> List.flatten()
    |> Enum.sum()
    |> IO.inspect()
  end

  defp step(:right, x, y, i), do: {x + i, y}
  defp step(:left, x, y, i), do: {x - i, y}
  defp step(:down, x, y, i), do: {x, y + i}
  defp step(:up, x, y, i), do: {x, y - i}
  defp step(:right_up, x, y, i), do: {x + i, y - i}
  defp step(:right_down, x, y, i), do: {x + i, y + i}
  defp step(:left_up, x, y, i), do: {x - i, y - i}
  defp step(:left_down, x, y, i), do: {x - i, y + i}

  defp matchesWord?(word, data, x, y, width, height, direction) do
    match =
    0..(String.length(word) - 1)
    |> Enum.all?(fn i ->
      {x, y} = step(direction, x, y, i)
      String.at(word, i) == access(data, x, y, width, height)
    end)
    #if match do
    #  IO.inspect({x, y, direction})
    #end
    match
  end

  defp access(tuple, x, y, w, h)
       when x >= 0 and x < w and y >= 0 and y < h do
    elem(tuple, x + y * w)
  end

  defp access(_, _, _, _, _), do: nil
end
