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
    'mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X',
    'mem[8] = 11',
    'mem[7] = 101',
    'mem[8] = 0'
  ]
end

def example_two_input
  [
    'mask = 000000000000000000000000000000X1001X',
    'mem[42] = 100',
    'mask = 00000000000000000000000000000000X0XX',
    'mem[26] = 1'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(165, part_one(example_one_input))
  end

  def test_part_one
    assert_equal(9_879_607_673_316, part_one(input))
  end

  def test_example_two
    assert_equal(208, part_two(example_two_input))
  end

  def test_part_two
    assert_equal(3_435_342_392_262, part_two(input))
  end
end

