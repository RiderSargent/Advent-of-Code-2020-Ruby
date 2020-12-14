# frozen_string_literal: true

def part_one(input, preamble_size = 25)
  instructions = parse(input)

  0.upto(instructions.length - 1) do |i|
    next if i + preamble_size >= instructions.length

    current_index = i + preamble_size
    currently_checking = instructions[current_index]
    preamble = instructions[i..current_index - 1]

    valid = preamble.combination(2).any? do |combo|
      a, b = combo

      a != b && a + b == currently_checking
    end

    return currently_checking unless valid
  end
end

def parse(input)
  result = []

  input.each do |line|
    result << line.to_i
  end

  result
end

