# frozen_string_literal: true

def part_one(input)
  program = parse(input)
  run_program(program).last
end

def part_two(input)
  program = parse(input)

  1.upto(program.length - 1) do |n|
    new_program = replace_nth(n, program)
    exit_code, acc = run_program(new_program)

    return acc if exit_code.zero?
  end
end

def replace_nth(nth, program)
  n = 0
  program.map do |line|
    new_op = line.first.gsub(/nop|jmp/) do |op|
      n += 1
      if n == nth
        op == "nop" ? "jmp" : "nop"
      else
        op
      end
    end
    [new_op, line.last]
  end
end

def run_program(program)
  acc = 0
  visited = []

  pointer = 0
  while pointer < program.length
    return [-1, acc] if visited.include? pointer

    visited << pointer
    instruction, parameter = program[pointer]

    case instruction
    when "acc"
      acc += parameter
      pointer += 1
    when "jmp"
      pointer += parameter
    when "nop"
      pointer += 1
    end
  end

  [0, acc]
end

def parse(input)
  program = []

  input.each do |line|
    instruction, parameter = line.split
    program << [instruction, parameter.to_i]
  end

  program
end
