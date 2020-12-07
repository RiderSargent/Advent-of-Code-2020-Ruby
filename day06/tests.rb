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
    'abc',
    '',
    'a',
    'b',
    'c',
    '',
    'ab',
    'ac',
    '',
    'a',
    'a',
    'a',
    'a',
    '',
    'b'
  ]
end

class TestDay < Minitest::Test
  def test_part_one_example
    assert_equal(11, part_one(example_input))
  end

  def test_part_one
    assert_equal(6612, part_one(input))
  end

  def test_part_two_example
    assert_equal(6, part_two(example_input))
  end

  def test_part_two
    assert_equal(3268, part_two(input))
  end
end

