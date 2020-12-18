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
    'mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X',
    'mem[8] = 11',
    'mem[7] = 101',
    'mem[8] = 0'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(165, part_one(example_input))
  end

  def test_part_one
    assert_equal(9_879_607_673_316, part_one(input))
  end
end

