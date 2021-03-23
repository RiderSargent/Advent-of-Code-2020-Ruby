# frozen_string_literal: true

require "minitest/autorun"
require "minitest/pride"
require_relative "code"

def input
  file_path = File.join(File.dirname(__FILE__), "input")
  File.open(file_path).read.split("\n")
end

def example_input_one
  [
    "light red bags contain 1 bright white bag, 2 muted yellow bags.",
    "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
    "bright white bags contain 1 shiny gold bag.",
    "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
    "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
    "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
    "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
    "faded blue bags contain no other bags.",
    "dotted black bags contain no other bags."
  ]
end

def example_input_two
  [
    "shiny gold bags contain 2 dark red bags.",
    "dark red bags contain 2 dark orange bags.",
    "dark orange bags contain 2 dark yellow bags.",
    "dark yellow bags contain 2 dark green bags.",
    "dark green bags contain 2 dark blue bags.",
    "dark blue bags contain 2 dark violet bags.",
    "dark violet bags contain no other bags."
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(4, part_one(example_input_one))
  end

  def test_part_one
    assert_equal(378, part_one(input))
  end

  def test_example_two
    assert_equal(32, part_two(example_input_one))
  end

  def test_example_three
    assert_equal(126, part_two(example_input_two))
  end

  def test_part_two
    assert_equal(27_526, part_two(input))
  end
end
