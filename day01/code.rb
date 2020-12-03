# frozen_string_literal: true

def part_one(input)
  input.combination(2).to_a.each do |combo|
    return combo.reduce(:*) if combo.reduce(:+) == 2020
  end
end

def part_two(input)
  input.combination(3).to_a.each do |combo|
    return combo.reduce(:*) if combo.reduce(:+) == 2020
  end
end

