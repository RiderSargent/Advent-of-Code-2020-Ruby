# frozen_string_literal: true

def part_one(input)
  input_parts = input.slice_when { |before, _after| before.empty? }.to_a

  rules =
    input_parts
      .first
      .filter { |line| !line.empty? }
      .map { |line| line.split(': ') }
      .map do |name, unparsed_rule|
        [
          name,
          unparsed_rule
            .split(' or ')
            .map { |range| range.split('-').map(&:to_i) }
            .map { |min, max| (min..max) }
        ]
      end

  nearby_tickets =
    input_parts
      .last
      .tap(&:shift)
      .map { |ticket| ticket.split(',').map(&:to_i) }

  nearby_tickets.sum do |ticket_numbers|
    invalid_numbers = ticket_numbers.filter do |number|
      rules.none? do |name, ranges|
        ranges.any? { |range| range.include? number }
      end
    end
    invalid_numbers.sum
  end
end

