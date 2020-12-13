# frozen_string_literal: true

def part_one(input)
  code = []
  acc = 0
  visited = []

  code = parse(input)

  pointer = 0
  loop do
    return acc if visited.include? pointer

    visited << pointer
    instruction, parameter = code[pointer]

    case instruction
    when 'acc'
      acc += parameter
      pointer += 1
    when 'jmp'
      pointer += parameter
    when 'nop'
      pointer += 1
    end
  end

  acc
end

def parse(input)
  code = []

  input.each do |line|
    instruction, parameter = line.split
    code << [ instruction, parameter.to_i ]
  end

  code
end

