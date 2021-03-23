# frozen_string_literal: true

require "minitest/autorun"
require "minitest/pride"
require_relative "code"

def input
  file_path = File.join(File.dirname(__FILE__), "input")
  File.open(file_path).read.split("\n").map(&:to_i)
end

def part_one_example_input
  [1721, 979, 366, 299, 675, 1456]
end

class TestDay < Minitest::Test
  def test_part_one_example
    assert_equal(514_579, part_one(part_one_example_input))
  end

  def test_part_one
    assert_equal(252_724, part_one(input))
  end

  def test_part_two
    assert_equal(276_912_720, part_two(input))
  end
end
