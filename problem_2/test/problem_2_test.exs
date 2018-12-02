defmodule Problem2Test do
  use ExUnit.Case
  doctest Problem2

  describe "count_letters/1" do
    import Problem2, only: [count_letters: 1]

    test "it counts the letters and returns a Map with them" do
      input = "abcabcdera"

      expected = %{
        "a" => 3,
        "b" => 2,
        "c" => 2,
        "d" => 1,
        "e" => 1,
        "r" => 1
      }

      assert count_letters(input) == expected
    end
  end

  describe "process_words/1" do
    import Problem2, only: [process_words: 1]

    test "calculates and returns all the letter frequencies" do
      input = "abcabcdera"

      expected = %{
        input => %{
          "a" => 3,
          "b" => 2,
          "c" => 2,
          "d" => 1,
          "e" => 1,
          "r" => 1
        }
      }

      assert process_words([input]) == expected
    end
  end

  describe "calculate_checksum/2" do
    import Problem2, only: [calculate_checksum: 2]

    test "calculates the checksum" do
      words = ~w{abcdef bababc abbcde abcccd aabcdd abcdee ababab}
      expected_checksum = 12

      assert calculate_checksum(words, [2,3]) == expected_checksum
    end
  end

  describe "checksum/1" do
    import Problem2, only: [checksum: 1]

    test "calculates the checksum" do
      assert checksum("input.txt") == 6696
    end
  end
end
