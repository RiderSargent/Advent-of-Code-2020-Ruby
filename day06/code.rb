# frozen_string_literal: true

def part_one(input)
  input << ''
  yes_answers = []
  groups = []

  input.each do |line|
    if line.empty?
      groups << yes_answers.join.chars.uniq.length
      yes_answers = []
    else
      yes_answers << line
    end
  end

  groups.sum
end

