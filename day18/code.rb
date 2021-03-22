# frozen_string_literal: true

def part_one(input)
  input.map { |line| process_line(line) }.sum
end

def part_two(input)
  input.map { |line| process_line_two(line) }.sum
end

def process_line(line)
  parenthetical_exp = /.*\(.*\).*/
  unreducible_re = /\(([^()]+)\)/

  while line.match?(parenthetical_exp)
    result = eval_exp(line.match(unreducible_re)[1]).to_s
    line = line.sub(unreducible_re, result)
  end

  eval_exp(line)
end

def eval_exp(exp)
  tokens = exp.split
  tokens = tokens[3..].unshift(tokens[0].to_i.send(tokens[1].to_sym, tokens[2].to_i)) while tokens.length > 2

  tokens.first
end

def process_line_two(line)
  parenthetical_exp = /.*\(.*\).*/
  unreducible_re = /\(([^()]+)\)/

  while line.match?(parenthetical_exp)
    unreducible = line.match(unreducible_re)[1]
    result = eval_add_then_mult(unreducible)
    line = line.sub(unreducible_re, result.to_s)
  end

  eval_add_then_mult(line).to_i
end

def eval_add_then_mult(exp)
  [ '+', '*' ].reduce(exp) { |memo, op| evaluate_operation(memo, op) }
end

def evaluate_operation(exp, operator)
  tokens = exp.split

  tokens.each_with_index do |t, i|
    next unless t == operator

    prev_i = i - 1
    next_i = i + 1

    tokens[next_i] = tokens[prev_i].to_i.send(operator, tokens[next_i].to_i).to_s
    tokens[prev_i] = nil
    tokens[i] = nil
  end

  tokens.compact.join(' ')
end

