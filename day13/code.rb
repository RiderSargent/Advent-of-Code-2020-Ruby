# frozen_string_literal: true

def part_one(input)
  earliest = input.first.to_i
  bus_ids = input.last.split(',').filter { |id| id != 'x' }.map(&:to_i)

  bus_ids.map! do |bid|
    [
      1.upto(Float::INFINITY).lazy.map { |x| x * bid }.drop_while { |m| m < earliest }.first,
      bid
    ]
  end

  next_bus = bus_ids.min

  (next_bus.first - earliest) * next_bus.last
end

