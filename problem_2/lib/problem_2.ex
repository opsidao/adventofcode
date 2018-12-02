defmodule Problem2 do
  def count_letters(word) do
    word
    |> String.graphemes()
    |> Enum.reduce(%{}, fn char, acc ->
      count = (acc |> Map.get(char, 0)) + 1
      acc |> Map.put(char, count)
    end)
  end
end
