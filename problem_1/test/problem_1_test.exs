defmodule Problem1Test do
  use ExUnit.Case
  doctest Problem1

  describe "read_lines/1" do
    import Problem1, only: [read_lines: 1]

    test "reads the lines and returns them as a MapList" do
      lines = read_lines("input.txt")

      assert is_list(lines)
      assert tuple_size(List.to_tuple(lines)) == 959
    end
  end

  describe "calculate_frequency/1" do
    import Problem1, only: [calculate_frequency: 1]

    test "finds the first repeated frequency when it's 0" do
      input = ["+1", "-1"]
      frequency = calculate_frequency(input)
      assert frequency === 0
    end

    test "finds the first repeated frequency when it's 10" do
      input = ["+3", "+3", "+4", "-2", "-4"]
      frequency = calculate_frequency(input)
      assert frequency === 10
    end

    test "finds the first repeated frequency when it's 5" do
      input = ["-6", "+3", "+8", "+5", "-6"]
      frequency = calculate_frequency(input)
      assert frequency === 5
    end

    test "finds the first repeated frequency when it's 14" do
      input = ["+7", "+7", "-2", "-7", "-4"]
      frequency = calculate_frequency(input)
      assert frequency === 14
    end
  end

  describe "process_file/1" do
    import Problem1, only: [process_file: 1]

    test "it reads the file and calculates the frequency" do
      frequency = process_file("input.txt")

      assert frequency === 55250
    end
  end
end
