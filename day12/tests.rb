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
    'F10',
    'N3',
    'F7',
    'R90',
    'F11'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(25, part_one(example_input))
  end

  def test_part_one
    assert_equal(858, part_one(input))
  end

  def test_example_two
    assert_equal(286, part_two(example_input))
  end

  def test_part_two
    assert_equal(39_140, part_two(input))
  end
end

