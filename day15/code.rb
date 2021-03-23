# frozen_string_literal: true

def part_one(input)
  nth_number(input, 2020)
end

def part_two(input)
  nth_number(input, 30_000_000)
end

def nth_number(input, target)
  prev_positions = {}
  prev_number = nil

  input.each_with_index do |number, i|
    prev_positions[prev_number] = i unless prev_number.nil?
    prev_number = number
  end

  (input.size..target).each do |i|
    prev_position = prev_positions[prev_number]

    next_number = prev_position.nil? ? 0 : i - prev_position
    prev_positions[prev_number] = i

    return prev_number if i == target

    prev_number = next_number
  end
end
