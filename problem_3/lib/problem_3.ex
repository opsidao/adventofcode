defmodule Problem3 do
  def calculate_overlaps(file_path) do
    used_claims =
      file_path
      |> File.stream!([], :line)
      |> Enum.reduce(%{}, fn claim, acc ->
        [claim_id, x_range, y_range] = extract_claim_details(claim)

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

  def find_non_overlapping_claim(file_path) when is_bitstring(file_path) do
    file_path
    |> File.stream!([], :line)
    |> Enum.reduce(%{}, fn claim, acc ->
      [claim_id, x_range, y_range] = extract_claim_details(claim)

      x_range
      |> Enum.reduce(acc, fn x, acc ->
        y_range
        |> Enum.reduce(acc, fn y, acc ->
          column = acc |> Map.get(x, %{})
          {count, claims} = column |> Map.get(y, {0, []})
          column = column |> Map.put(y, {count + 1, [claim_id, claims]})

          acc |> Map.put(x, column)
        end)
      end)
    end)
    |> find_non_overlapping_claim()
  end

  def find_non_overlapping_claim(tiles_map) when is_map(tiles_map) do
    claims = tiles_map
    |> Map.values()
    |> Enum.flat_map(& &1)
    |> Enum.map(fn {_, {_, claims}} -> claims end)

    claims_with_overlap = claims
    |> Enum.filter(fn [_head,tail] -> length(tail) > 0 end)
    |> List.flatten()
    |> Enum.uniq()

    all_claims = claims
    |> List.flatten()
    |> Enum.uniq()

    [claim_id] = all_claims -- claims_with_overlap

    claim_id |> String.replace("#", "") |> String.to_integer
  end

  defp extract_claim_details(claim) do
    [claim_id, "@", coords, size] = claim |> String.split()
    [width, height] = size |> String.split("x") |> Enum.map(&String.to_integer/1)

    [x, y] =
      coords
      |> String.replace_trailing(":", "")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    [claim_id, x..(x + width - 1), y..(y + height - 1)]
  end
end
