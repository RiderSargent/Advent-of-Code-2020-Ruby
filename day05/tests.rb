# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  file_path = File.join(File.dirname(__FILE__), 'input')
  File.open(file_path).read.split("\n")
end

class TestDay < Minitest::Test
  def test_part_one_example_one
    assert_equal(357, part_one([ 'FBFBBFFRLR' ]))
  end

  def test_part_one_example_two
    assert_equal(567, part_one([ 'BFFFBBFRRR' ]))
  end

  def test_part_one_example_three
    assert_equal(119, part_one([ 'FFFBBBFRRR' ]))
  end

  def test_part_one_example_four
    assert_equal(820, part_one([ 'BBFFBBFRLL' ]))
  end

  def test_part_one
    assert_equal(864, part_one(input))
  end

  def test_part_two
    assert_equal(739, part_two(input))
  end
end

