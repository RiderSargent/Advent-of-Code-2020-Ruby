# frozen_string_literal: true

def part_one(input)
  rules = rules_from(input)
  rules_re = regex_from(rules)

  messages_from(input).filter { |m| m.match?(rules_re) }.count
end

def rules_from(input)
  rules_input = input.take_while { |line| !line.empty? }
  parse_rules(rules_input)
end

def parse_rules(rules_input)
  result = {}

  rules_input.each do |rule|
    k, v = rule.split(': ')
    result[k] = v.tr('\"', '')
  end

  result
end

def regex_from(rules)
  result = wrap_branches(rules)

  while result['0'].match?(/\d/)
    reduced = get_reduced(result)
    keys_re = get_regex(reduced)
    result.each { |k, v| result[k] = v.gsub(keys_re, reduced) }
    result.delete_if { |k, _| reduced.key?(k) }
  end

  "^#{result['0'].tr(' ', '')}$"
end

def wrap_branches(rules)
  result = rules.dup
  result.each { |k, v| result[k] = "(#{v})" if v.match?(/\|/) }
end

def get_reduced(rules)
  rules.filter { |_, v| !v.match(/\d/) }
end

def get_regex(rules)
  Regexp.new(rules.keys.map { |k| "\\b#{k}\\b" }.join('|').to_s)
end

def messages_from(input)
  input.drop_while { |line| !line.empty? }[1..]
end

