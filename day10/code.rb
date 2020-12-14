# frozen_string_literal: true

def part_one(input)
  sorted = [ 0 ] + parse(input).sort
  sorted << sorted.max + 3

  diffs = []
  0.upto(sorted.length - 2) do |i|
    diffs << sorted[i + 1] - sorted[i]
  end

  (diffs.filter { |n| n == 1 }.count) * (diffs.filter { |n| n == 3 }.count)
end

def parse(input)
  input.map(&:to_i)
end

