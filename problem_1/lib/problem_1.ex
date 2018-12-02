defmodule Problem1 do
  def process_file(file_path) do
    file_path |> read_lines() |> calculate_frequency()
  end

  def read_lines(file_path) do
    with {:ok, file_content} <- file_path |> File.read(),
         lines <- file_content |> String.split()
    do
      lines
    else
      res -> res
    end
  end

  def calculate_frequency(input_frequencies) do
    input_frequencies = input_frequencies |> Enum.map(&(String.to_integer(&1)))

    rec_calculate_frequency(input_frequencies, input_frequencies, MapSet.new([0]), 0)
  end

  defp rec_calculate_frequency(initial_frequencies, [current_frequency|other_frequencies], previous_frequencies, last_frequency) do
    new_frequency = last_frequency + current_frequency

    if previous_frequencies |> MapSet.member?(new_frequency) do
      new_frequency
    else
      previous_frequencies = previous_frequencies |> MapSet.put(new_frequency)

      if length(other_frequencies) == 0 do
        rec_calculate_frequency(initial_frequencies, initial_frequencies, previous_frequencies, new_frequency)
      else
        rec_calculate_frequency(initial_frequencies, other_frequencies, previous_frequencies, new_frequency)
      end
    end
  end
end
