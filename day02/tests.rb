# frozen_string_literal: true

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
    '2-9 c: ccccccccc'
  ]
end

class TestDay < Minitest::Test
  def test_part_one_example
    assert_equal(2, part_one(example_input))
  end

  def test_part_one
    assert_equal(564, part_one(input))
  end

  def test_part_two_example
    assert_equal(1, part_two(example_input))
  end

  def test_part_two
    assert_equal(325, part_two(input))
  end
end

