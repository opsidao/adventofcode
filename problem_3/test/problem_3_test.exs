defmodule Problem3Test do
  use ExUnit.Case
  doctest Problem3

  describe "calculate_overlaps/1" do
    import Problem3, only: [calculate_overlaps: 1]

    test "calculates the overlapping area" do
      assert calculate_overlaps("test_input.txt") == 4
    end

    test "calculates the overlapping area on the real file" do
      assert calculate_overlaps("input.txt") == 111_630
    end
  end

  describe "find_non_overlapping_claim/1" do
    import Problem3, only: [find_non_overlapping_claim: 1]

    test "returns the claim with no overlaps" do
      assert find_non_overlapping_claim("test_input.txt") == 3
    end

    test "returns the claim with no overlaps on the real file" do
      assert find_non_overlapping_claim("input.txt") == 724
    end
  end
end
