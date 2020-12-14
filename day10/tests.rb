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
    '16',
    '10',
    '15',
    '5',
    '1',
    '11',
    '7',
    '19',
    '6',
    '12',
    '4'
  ]
end

def example_two_input
  [
    '28',
    '33',
    '18',
    '42',
    '31',
    '14',
    '46',
    '20',
    '48',
    '47',
    '24',
    '23',
    '49',
    '45',
    '19',
    '38',
    '39',
    '11',
    '1',
    '32',
    '25',
    '35',
    '8',
    '17',
    '7',
    '9',
    '4',
    '2',
    '34',
    '10',
    '3'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(35, part_one(example_one_input))
  end

  def test_example_two
    assert_equal(220, part_one(example_two_input))
  end

  def test_part_one
    assert_equal(1700, part_one(input))
  end
end

