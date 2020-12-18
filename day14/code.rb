# frozen_string_literal: true

def part_one(input)
  mask = ''
  mem = []

  input.map do |line|
    line.match(/(mask|mem\[(\d+)\]) = (\S+)/) do |m|
      address = m[2]
      value = m[3]

      if address.nil?
        mask = value
      else
        mem[address.to_i] = apply_mask(mask, value)
      end
    end
  end

  sum(mem)
end

def sum(mem)
  mem.filter { |m| !m.nil? }.reduce(0) do |acc, address|
    acc + address.to_i(2)
  end
end

def apply_mask(mask, value)
  b_value = value.to_i.to_s(2).rjust(36, '0')
  (0...36).each do |i|
    b_value[i] = mask[i] unless mask[i] == 'X'
  end
  b_value
end

