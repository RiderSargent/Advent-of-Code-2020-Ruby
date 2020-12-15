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
    'L.LL.LL.LL',
    'LLLLLLL.LL',
    'L.L.L..L..',
    'LLLL.LL.LL',
    'L.LL.LL.LL',
    'L.LLLLL.LL',
    '..L.L.....',
    'LLLLLLLLLL',
    'L.LLLLLL.L',
    'L.LLLLL.LL'
  ]
end

def expected_after_first_round
  [
    '#.##.##.##',
    '#######.##',
    '#.#.#..#..',
    '####.##.##',
    '#.##.##.##',
    '#.#####.##',
    '..#.#.....',
    '##########',
    '#.######.#',
    '#.#####.##'
  ]
end

def expected_after_second_round
  [
    '#.LL.L#.##',
    '#LLLLLL.L#',
    'L.L.L..L..',
    '#LLL.LL.L#',
    '#.LL.LL.LL',
    '#.LLLL#.##',
    '..L.L.....',
    '#LLLLLLLL#',
    '#.LLLLLL.L',
    '#.#LLLL.##'
  ]
end

def expected_after_third_round
  [
    '#.##.L#.##',
    '#L###LL.L#',
    'L.#.#..#..',
    '#L##.##.L#',
    '#.##.LL.LL',
    '#.###L#.##',
    '..#.#.....',
    '#L######L#',
    '#.LL###L.L',
    '#.#L###.##'
  ]
end

def expected_after_fourth_round
  [
    '#.#L.L#.##',
    '#LLL#LL.L#',
    'L.L.L..#..',
    '#LLL.##.L#',
    '#.LL.LL.LL',
    '#.LL#L#.##',
    '..L.L.....',
    '#L#LLLL#L#',
    '#.LLLLLL.L',
    '#.#L#L#.##'
  ]
end

def expected_after_fifth_round
  [
    '#.#L.L#.##',
    '#LLL#LL.L#',
    'L.#.L..#..',
    '#L##.##.L#',
    '#.#L.LL.LL',
    '#.#L#L#.##',
    '..L.L.....',
    '#L#L##L#L#',
    '#.LLLLLL.L',
    '#.#L#L#.##'
  ]
end

class TestDay < Minitest::Test
  def test_next_round_for_round_one
    assert_equal(expected_after_first_round, next_round(example_input))
  end

  def test_example_one_second_round
    assert_equal(expected_after_second_round, next_round(expected_after_first_round))
  end

  def test_example_one_third_round
    assert_equal(expected_after_third_round, next_round(expected_after_second_round))
  end

  def test_example_one_fourth_round
    assert_equal(expected_after_fourth_round, next_round(expected_after_third_round))
  end

  def test_example_one_fifth_round
    assert_equal(expected_after_fifth_round, next_round(expected_after_fourth_round))
  end

  def test_example_one_sixth_round
    assert_equal(expected_after_fifth_round, next_round(expected_after_fifth_round))
  end

  def test_count_seated
    assert_equal(37, count_seated(expected_after_fifth_round))
  end

  def test_example
    assert_equal(37, part_one(example_input))
  end

  def test_part_one
    assert_equal(2_418, part_one(input))
  end
end

