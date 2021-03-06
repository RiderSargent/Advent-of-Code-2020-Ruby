# frozen_string_literal: true

def part_one(input)
  input.count do |line|
    /(\d+)-(\d+) (\S): (\S+)/.match(line) do |m|
      l, h, c, s = m.captures
      s.count(c) >= l.to_i && s.count(c) <= h.to_i
    end
  end
end

def part_two(input)
  input.count do |line|
    /(\d+)-(\d+) (\S): (\S+)/.match(line) do |m|
      l, h, c, s = m.captures
      i1 = l.to_i - 1
      i2 = h.to_i - 1
      (s[i1] == c) ^ (s[i2] == c)
    end
  end
end
