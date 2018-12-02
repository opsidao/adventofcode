defmodule Problem2 do
  def checksum(file_path) do
    file_path |> read_lines() |> calculate_checksum([2,3])
  end

  def calculate_checksum(word_list, checksum_frequencies) do
    word_list
    |> process_words()
    |> Enum.flat_map(fn {_word, char_frequencies} ->
      char_frequencies
      |> Enum.filter(fn {_char, frequency} -> checksum_frequencies |> Enum.member?(frequency) end)
      |> Enum.uniq_by(fn {_char, frequency} -> frequency end)
    end)
    |> Enum.reduce(%{}, fn {_char, frequency}, acc ->
      acc |> Map.put(frequency, Map.get(acc, frequency, 0) + 1)
    end)
    |> Enum.reduce(1, fn {_, count}, acc -> acc * count end)
  end

  def process_words(word_list) do
    word_list
    |> Enum.reduce(%{}, fn word, acc ->
      acc |> Map.put(word, count_letters(word))
    end)
  end

  def count_letters(word) do
    word
    |> String.graphemes()
    |> Enum.reduce(%{}, fn char, acc ->
      count = (acc |> Map.get(char, 0)) + 1
      acc |> Map.put(char, count)
    end)
  end

  # TODO Same is in problem1, extract this
  defp read_lines(file_path) do
    with {:ok, file_content} <- file_path |> File.read(),
         lines <- file_content |> String.split() do
      lines
    else
      res -> res
    end
  end
end
