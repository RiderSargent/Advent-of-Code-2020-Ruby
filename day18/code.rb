# frozen_string_literal: true

def part_one(input)
  input.map { |line| process_line(line) }.sum
end

def process_line(line)
  while paren_expression?(line)
    innermost_exp = /\((?<exp>[^()]+)\)/

    line.match(innermost_exp) do |m|
      line = line.sub(innermost_exp, eval_exp(m['exp']).to_s)
    end
  end

  eval_exp(line)
end

def paren_expression?(line)
  line.match?(/.*\(.*\).*/)
end

def eval_exp(exp)
  tokens = exp.split
  tokens = tokens[3..].unshift(tokens[0].to_i.send(tokens[1].to_sym, tokens[2].to_i)) while tokens.length > 2

  tokens.first
end

