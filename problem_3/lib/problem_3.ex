defmodule Problem3 do
  def calculate_overlaps(file_path) do
    used_claims =
      file_path
      |> File.stream!([], :line)
      |> Enum.reduce(%{}, fn claim, acc ->
        [_claim_id, "@", coords, size] = claim |> String.split()
        [width, height] = size |> String.split("x") |> Enum.map(&String.to_integer/1)

        [x, y] =
          coords
          |> String.replace_trailing(":", "")
          |> String.split(",")
          |> Enum.map(&String.to_integer/1)

        x_range = x..(x + width - 1)
        y_range = y..(y + height - 1)

        x_range
        |> Enum.reduce(acc, fn x, acc ->
          y_range
          |> Enum.reduce(acc, fn y, acc ->
            column = acc |> Map.get(x, %{})
            count = column |> Map.get(y, 0)
            column = column |> Map.put(y, count + 1)

            acc |> Map.put(x, column)
          end)
        end)
      end)

    used_claims
    |> Enum.reduce(0, fn {_column_number, column}, acc ->
      overlaps = column |> Map.values() |> Enum.filter(&(&1 > 1)) |> length()
      acc + overlaps
    end)
  end
end
