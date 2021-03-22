# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'code'

def input
  file_path = File.join(File.dirname(__FILE__), 'input')
  File.open(file_path).read.split("\n")
end

def example_one_input
  [ '1 + 2 * 3 + 4 * 5 + 6' ]
end

def example_two_input
  [ '1 + (2 * 3) + (4 * (5 + 6))' ]
end

def example_three_input
  [ '2 * 3 + (4 * 5)' ]
end

def example_four_input
  [ '5 + (8 * 3 + 9 + 3 * 4 * 3)' ]
end

def example_five_input
  [ '5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))' ]
end

def example_six_input
  [ '((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2' ]
end

def example_seven_input
  example_two_input
end

def example_eight_input
  [ '2 * 3 + (4 * 5)' ]
end

def example_nine_input
  [ '5 + (8 * 3 + 9 + 3 * 4 * 3)' ]
end

def example_ten_input
  [ '5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))' ]
end

def example_eleven_input
  [ '((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2' ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(71, part_one(example_one_input))
  end

  def test_example_two
    assert_equal(51, part_one(example_two_input))
  end

  def test_example_three
    assert_equal(26, part_one(example_three_input))
  end

  def test_example_four
    assert_equal(437, part_one(example_four_input))
  end

  def test_example_five
    assert_equal(12_240, part_one(example_five_input))
  end

  def test_example_six
    assert_equal(13_632, part_one(example_six_input))
  end

  def test_part_one
    assert_equal(3_348_222_486_398, part_one(input))
  end

  def test_example_seven
    assert_equal(51, part_two(example_seven_input))
  end

  def test_example_eight
    assert_equal(46, part_two(example_eight_input))
  end

  def test_example_nine
    assert_equal(1_445, part_two(example_nine_input))
  end

  def test_example_ten
    assert_equal(669_060, part_two(example_ten_input))
  end

  def test_example_eleven
    assert_equal(23_340, part_two(example_eleven_input))
  end

  def test_part_two
    assert_equal(43_423_343_619_505, part_two(input))
  end
end

