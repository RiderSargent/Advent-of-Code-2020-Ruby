# frozen_string_literal: true

def parse(input)
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

  my_ticket =
    input_parts[1][1]
      .split(',')
      .map(&:to_i)

  nearby_tickets =
    input_parts
      .last
      .tap(&:shift)
      .map { |ticket| ticket.split(',').map(&:to_i) }

  [ rules, my_ticket, nearby_tickets ]
end

def part_one(input)
  rules, _my_ticket, nearby_tickets = parse(input)

  nearby_tickets.sum do |ticket_numbers|
    invalid_numbers = ticket_numbers.filter do |number|
      rules.none? do |name, ranges|
        ranges.any? { |range| range.include? number }
      end
    end
    invalid_numbers.sum
  end
end

def part_two(input)
  rules, my_ticket, nearby_tickets = parse(input)

  valid_nearby_tickets =
    nearby_tickets.filter do |ticket_numbers|
      ticket_numbers.all? do |number|
        rules.any? do |name, ranges|
          ranges.any? { |range| range.include? number }
        end
      end
    end

  columns = valid_nearby_tickets.transpose

  rules_with_matching_columns = {}

  rules.each do |name, ranges|
    rules_with_matching_columns[name] = []
    columns.each_with_index do |column, c_index|
      rules_with_matching_columns[name] << c_index if column.all? { |v| ranges.first.include?(v) || ranges.last.include?(v) }
    end
  end

  fields = {}

  while rules_with_matching_columns.values.any? { |cols| cols.length > 1 }
    rules_with_matching_columns.each do |rule, matching_cols|
      if matching_cols.length == 1
        matched_col = matching_cols.first
        fields[rule] = matched_col

        rules_with_matching_columns.each do |rule, columns|
          rules_with_matching_columns[rule] = columns.filter { |v| v != matched_col }
        end
      end
    end
  end

  fields
    .filter { |rule, col| rule.match?("departure") }
    .map { |_, col| col }
    .reduce(1) { |memo, index| memo *= my_ticket[index] }
end

