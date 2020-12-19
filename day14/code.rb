# frozen_string_literal: true

def part_one(input)
  mask = ''
  mem = {}

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

  mem.values.sum
end

def part_two(input)
  mask = ''
  mem = {}

  input.each do |line|
    line.match(/(mask|mem\[(\d+)\]) = (\S+)/) do |m|
      address = m[2]
      value = m[3]

      if address.nil?
        mask = value
      else
        decode_addresses(address.to_i, mask).each do |a|
          mem[a] = value.to_i
        end
      end
    end
  end

  mem.values.sum
end

def decode_addresses(address, mask)
  address = to_bin(address)
  x_count = mask.count('X')

  masked_address = apply_mask_to_address(mask, address)

  x_combinations = (2**x_count - 1).downto(0).map do |val|
    to_bin(val, x_count)
  end

  x_combinations.map do |combo|
    masked_address.gsub('X', '%s') % combo.split('')
  end
end

def apply_mask_to_address(mask, address)
  mask.chars.zip(address.chars).map { |m, a| m == '0' ? a : m }.join
end

def apply_mask(mask, value)
  b_value = to_bin(value)
  (0...36).each do |i|
    b_value[i] = mask[i] unless mask[i] == 'X'
  end
  b_value.to_i(2)
end

def to_bin(n, length = 36)
  n.to_i.to_s(2).rjust(length, '0')
end

