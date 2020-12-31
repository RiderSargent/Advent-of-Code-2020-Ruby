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
    'class: 1-3 or 5-7',
    'row: 6-11 or 33-44',
    'seat: 13-40 or 45-50',
    '',
    'your ticket:',
    '7,1,14',
    '',
    'nearby tickets:',
    '7,3,47',
    '40,4,50',
    '55,2,20',
    '38,6,12'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(71, part_one(example_one_input))
  end

  def test_part_one
    assert_equal(29_851, part_one(input))
  end

  def test_part_two
    assert_equal(3_029_180_675_981, part_two(input))
  end
end

