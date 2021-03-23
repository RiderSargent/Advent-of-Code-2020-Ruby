# frozen_string_literal: true

def part_one(input)
  arr = input.map(&:to_i).sort

  arr.prepend(0)
  arr.append(arr.max + 3)

  diffs = []
  0.upto(arr.length - 2) do |i|
    diffs << arr[i + 1] - arr[i]
  end

  diffs.count(1) * diffs.count(3)
end

def part_two(input)
  arr = input.map(&:to_i).sort

  arrangements(0, arr, arr.max + 3)
end

def arrangements(prev, arr, last, cache = {})
  count = 0

  arr.each_with_index do |n, i|
    break if invalid?(n, prev, last)
    break count += 1 if n + 3 == last

    cache[n] = arrangements(n, arr[i + 1..], last, cache) unless cache.key?(n)

    count += cache[n]
  end

  count
end

def invalid?(num, prev, last)
  prev + 3 < num || num + 3 > last
end

def parse(input)
  input.map(&:to_i)
end
