require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  path = File.join(File.dirname(__FILE__), 'input')

  input = []

  File.foreach(path, chomp: true) { |line| input << line }

  input
end

def example_input
  [
    '1-3 a: abcde',
    '1-3 b: cdefg',
    '2-9 c: ccccccccc',
  ]
end

class TestDay < Minitest::Test
  def test_part_1_example
    assert_equal(2, part_1(example_input))
  end

  def test_part_1
    assert_equal(564, part_1(input))
  end
end
