# frozen_string_literal: true

require "minitest/autorun"
require "minitest/pride"
require_relative "code"

def input
  [1, 20, 8, 12, 0, 14]
end

def example_one_input
  [0, 3, 6]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(436, part_one(example_one_input))
  end

  def test_part_one
    assert_equal(492, part_one(input))
  end

  def test_example_two
    assert_equal(175_594, part_two(example_one_input))
  end

  def test_part_two
    assert_equal(63_644, part_two(input))
  end
end
