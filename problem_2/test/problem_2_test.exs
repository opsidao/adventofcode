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
end
