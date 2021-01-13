# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  [
    '#...#.#.',
    '..#.#.##',
    '..#..#..',
    '.....###',
    '...#.#.#',
    '#.#.##..',
    '#####...',
    '.#.#.##.'
  ]
end

def example_input
  [
    '.#.',
    '..#',
    '###'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(112, part_one(example_input))
  end

  def test_part_one
    assert_equal(401, part_one(input))
  end
end

