def part_1(input)
  input.combination(2).to_a.each do |combo|
    return combo.reduce(:*) if combo.reduce(:+) == 2020
  end
end

def part_2(input)
  input.combination(3).to_a.each do |combo|
    return combo.reduce(:*) if combo.reduce(:+) == 2020
  end
end

