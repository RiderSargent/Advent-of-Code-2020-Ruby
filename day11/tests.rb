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

def part_one_round_one_expected
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

def part_one_round_two_expected
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

def part_one_round_three_expected
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

def part_one_round_four_expected
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

def part_one_round_five_expected
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

def part_two_round_two_expected
  [
    '#.LL.LL.L#',
    '#LLLLLL.LL',
    'L.L.L..L..',
    'LLLL.LL.LL',
    'L.LL.LL.LL',
    'L.LLLLL.LL',
    '..L.L.....',
    'LLLLLLLLL#',
    '#.LLLLLL.L',
    '#.LLLLL.L#'
  ]
end

def visible_from_example_input
  [
    '.......#.',
    '...#.....',
    '.#.......',
    '.........',
    '..#L....#',
    '....#....',
    '.........',
    '#........',
    '...#.....'
  ]
end

def no_visible_seats_example_input
  [
    '.##.##.',
    '#.#.#.#',
    '##...##',
    '...L...',
    '##...##',
    '#.#.#.#',
    '.##.##.'
  ]
end

def only_empty_seats_visible_example_input
  [
    '#..#..#',
    '.L.L.L.',
    '.......',
    '#L.L.L#',
    '.......',
    '.L.L.L.',
    '#..#..#'
  ]
end

class TestDay < Minitest::Test
  def test_next_round_for_example_input
    assert_equal(part_one_round_one_expected, next_round(example_input))
  end

  def test_second_round_example_one
    assert_equal(part_one_round_two_expected, next_round(part_one_round_one_expected))
  end

  def test_third_round_example_one
    assert_equal(part_one_round_three_expected, next_round(part_one_round_two_expected))
  end

  def test_fourth_round_example_one
    assert_equal(part_one_round_four_expected, next_round(part_one_round_three_expected))
  end

  def test_fifth_round_example_one
    assert_equal(part_one_round_five_expected, next_round(part_one_round_four_expected))
  end

  def test_sixth_round_example_one
    assert_equal(part_one_round_five_expected, next_round(part_one_round_five_expected))
  end

  def test_count_seated
    assert_equal(37, count_seated(part_one_round_five_expected))
  end

  def test_example
    assert_equal(37, part_one(example_input))
  end

  def test_visible_from
    assert_equal(8, visible_from(4, 3, visible_from_example_input))
  end

  def test_no_visible_seats_example
    assert_equal(0, visible_from(3, 3, no_visible_seats_example_input))
  end

  def test_only_empty_seats_visible_example
    assert_equal(0, visible_from(3, 3, only_empty_seats_visible_example_input))
  end

  def test_part_one
    assert_equal(2_418, part_one(input))
  end

  def test_next_round_two_for_example_input
    assert_equal(part_one_round_one_expected, next_round_part_two(example_input))
  end

  def test_second_round_for_example_two
    assert_equal(part_two_round_two_expected, next_round_part_two(part_one_round_one_expected))
  end

  def test_part_two_example
    assert_equal(26, part_two(example_input))
  end

  def test_part_two
    assert_equal(2_144, part_two(input))
  end
end

