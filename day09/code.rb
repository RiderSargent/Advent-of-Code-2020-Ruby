# frozen_string_literal: true

def part_one(input, preamble_size = 25)
  numbers = parse(input)

  0.upto(numbers.length - 1) do |i|
    next if i + preamble_size >= numbers.length

    current_index = i + preamble_size
    currently_checking = numbers[current_index]
    preamble = numbers[i..current_index - 1]

    valid = preamble.combination(2).any? do |combo|
      a, b = combo

      a != b && a + b == currently_checking
    end

    return currently_checking unless valid
  end
end

def part_two(input, preamble_size = 25)
  invalid_number = part_one(input, preamble_size)

  numbers = parse(input)

  0.upto(numbers.length - 2) do |n|
    1.upto(numbers.length) do |m|
      slice = numbers[n..n + m]
      return slice.min + slice.max if slice.to_a.reduce(&:+) == invalid_number
    end
  end
end

def parse(input)
  input.map(&:to_i)
end
