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
end

