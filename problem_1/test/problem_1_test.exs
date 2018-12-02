defmodule Problem1Test do
  use ExUnit.Case
  doctest Problem1

  describe "read_lines/1" do
    import Problem1, only: [read_lines: 1]

    test "reads the lines and returns them as a MapList" do
      lines = read_lines("input.txt")

      assert is_list(lines)
      assert tuple_size(List.to_tuple lines) == 959
    end
  end

  describe "calculate_frequency/1" do
    import Problem1, only: [calculate_frequency: 1]

    test "it calculates the frequency" do
      input = ["+1", "+2", "-3", "+10", "-17"]

      frequency = calculate_frequency(input)

      assert frequency === -7
    end
  end

  describe "process_file/1" do
    import Problem1, only: [process_file: 1]

    test "it reads the file and calculates the frequency" do
      frequency = process_file("input.txt")

      assert frequency === 408
    end
  end
end
