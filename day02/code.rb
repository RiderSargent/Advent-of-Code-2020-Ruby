def part_1(input)
  input.filter do |line|
    /(\d+)-(\d+) (\S): (\S+)/.match(line) do |m|
      l, h, c, s = m.captures
      s.count(c) >= l.to_i && s.count(c) <= h.to_i
    end
  end.count
end

def part_2(input)
  input.filter do |line|
    /(\d+)-(\d+) (\S): (\S+)/.match(line) do |m|
      l, h, c, s = m.captures
      i1 = l.to_i - 1
      i2 = h.to_i - 1
      (s[i1] == c) ^ (s[i2] == c)
    end
  end.count
end

