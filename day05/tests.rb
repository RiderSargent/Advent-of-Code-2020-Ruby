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
end

