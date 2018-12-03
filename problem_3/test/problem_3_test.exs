defmodule Problem3Test do
  use ExUnit.Case
  doctest Problem3

  import Problem3, only: [calculate_overlaps: 1]

  test "calculates the overlapping area" do
    assert calculate_overlaps("test_input.txt") == 4
  end

  test "calculates the overlapping area on the real file" do
    assert calculate_overlaps("input.txt") == 111_630
  end
end
