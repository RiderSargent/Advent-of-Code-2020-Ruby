# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  file_path = File.join(File.dirname(__FILE__), 'input')
  File.open(file_path).read.split("\n")
end

def example_one_input
  [
    '0: 4 1 5',
    '1: 2 3 | 3 2',
    '2: 4 4 | 5 5',
    '3: 4 5 | 5 4',
    '4: "a"',
    '5: "b"',
    '',
    'ababbb',
    'bababa',
    'abbbab',
    'aaabbb',
    'aaaabbb'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(2, part_one(example_one_input))
  end

  def test_part_one
    assert_equal(187, part_one(input))
  end
end

