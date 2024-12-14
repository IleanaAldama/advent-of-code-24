defmodule AdventDayThree do
  @reg ~r/mul\((\d+),(\d+)\)/
  def main(_args) do
    @reg
    |> Regex.scan(IO.read(:stdio, :eof))
    |> Enum.map(fn [_, a, b] ->
      String.to_integer(a) * String.to_integer(b)
    end)
    |> Enum.sum()
    |> IO.inspect(label: "result")
  end
end
