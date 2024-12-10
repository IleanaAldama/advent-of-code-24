defmodule AdventDayOne do
  defp is_pair?(x), do: rem(x, 2) == 0
  def main(_args) do
    # Read the whole input in a single pass
    input = IO.read(:stdio, :eof)
    {list1, list2} =
      input
      |> String.split("\n")
      |> Enum.map(&String.split/1)
      |> List.flatten()
      |> Enum.filter(&(String.length(&1) >= 1))
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
      |> Enum.reduce({[], []}, fn {current, index}, {list1, list2} ->
        # if index is pair, number goes to list1, otherwise to list2
        if is_pair?(index) do
            {[current| list1], list2}
        else
            {list1, [current| list2]}
        end
      end)

    # Time to sort both lists and zipped it in order to get the distances
    list1
    |> Enum.sort()
    |> Enum.zip(Enum.sort(list2))
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
    |> IO.inspect(label: "result")
  end
end
