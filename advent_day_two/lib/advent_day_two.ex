defmodule AdventDayTwo do
  def main(_args) do
    IO.read(:stdio, :eof)
    |> String.split("\n", trim: true)
    |> Enum.map(&(&1 |> prep_list() |> check_inc()))
    |> Enum.count(&(&1 == :safe))
    |> IO.inspect(label: "result")
  end

  defp prep_list(str) do
    str
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp check_inc(numbers, direction \\ nil)

  defp check_inc([_x], direction) do
    case direction do
      :increase -> :safe
      :decrease -> :safe
      _ -> :unsafe
    end
  end

  defp check_inc([a, b | rest], direction) do
    case {a - b, direction} do
      {c, direction} when c > 0 and c <= 3 and (direction == :decrease or direction == nil) ->
        check_inc([b | rest], :decrease)

      {c, direction} when c < 0 and c >= -3 and (direction == :increase or direction == nil) ->
        check_inc([b | rest], :increase)

      _ ->
        :unsafe
    end
  end
end
