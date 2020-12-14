# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  file_path = File.join(File.dirname(__FILE__), 'input')
  File.open(file_path).read.split("\n")
end

def example_input
  [
    '35',
    '20',
    '15',
    '25',
    '47',
    '40',
    '62',
    '55',
    '65',
    '95',
    '102',
    '117',
    '150',
    '182',
    '127',
    '219',
    '299',
    '277',
    '309',
    '576'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(127, part_one(example_input, 5))
  end

  def test_part_one
    assert_equal(31_161_678, part_one(input))
  end

  def test_example_two
    assert_equal(62, part_two(example_input, 5))
  end

  def test_part_two
    assert_equal(5_453_868, part_two(input))
  end
end

