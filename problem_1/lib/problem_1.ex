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
    input_frequencies |> Enum.map(&(String.to_integer(&1))) |> Enum.sum()
  end
end
