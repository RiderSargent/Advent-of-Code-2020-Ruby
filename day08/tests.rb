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
    'nop +0',
    'acc +1',
    'jmp +4',
    'acc +3',
    'jmp -3',
    'acc -99',
    'acc +1',
    'jmp -4',
    'acc +6'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(5, part_one(example_input))
  end

  def test_part_one
    assert_equal(1797, part_one(input))
  end
end

