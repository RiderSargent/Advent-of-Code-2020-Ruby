# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  file_path = File.join(File.dirname(__FILE__), 'input')
  File.open(file_path).read.split("\n")
end

def example_one_input
  [ '1 + 2 * 3 + 4 * 5 + 6' ]
end

def example_two_input
  [ '1 + (2 * 3) + (4 * (5 + 6))' ]
end

def example_three_input
  [ '2 * 3 + (4 * 5)' ]
end

def example_four_input
  [ '5 + (8 * 3 + 9 + 3 * 4 * 3)' ]
end

def example_five_input
  [ '5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))' ]
end

# ((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2 becomes 13632.

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(71, part_one(example_one_input))
  end

  def test_example_two
    assert_equal(51, part_one(example_two_input))
  end

  def test_example_three
    assert_equal(26, part_one(example_three_input))
  end

  def test_example_four
    assert_equal(437, part_one(example_four_input))
  end

  def test_example_five
    assert_equal(12_240, part_one(example_five_input))
  end

  def test_part_one
    assert_equal(3_348_222_486_398, part_one(input))
  end
end

