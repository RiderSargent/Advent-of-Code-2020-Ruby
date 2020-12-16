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
    '939',
    '7,13,x,x,59,x,31,19'
  ]
end

class TestDay < Minitest::Test
  def test_example_one
    assert_equal(295, part_one(example_input))
  end

  def test_part_one
    assert_equal(3_789, part_one(input))
  end
end

