require 'minitest/autorun'
require_relative 'code'

def input
  path = File.join(File.dirname(__FILE__), 'input')

  input = []

  File.foreach(path, chomp: true) { |line| input << line.to_i }

  input
end

def part_1_example_input
  [ 1721, 979, 366, 299, 675, 1456 ]
end

class TestDay < Minitest::Test
  def test_part_1_example
    assert_equal(514579, part_1(part_1_example_input))
  end

  def test_part_1
    assert_equal(252724, part_1(input))
  end
end
