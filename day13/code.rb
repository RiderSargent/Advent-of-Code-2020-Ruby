# frozen_string_literal: true

def part_one(input)
  arrival_ts = input.first.to_i
  bus_ids = parse_times_and_offsets(input).map(&:first)

  bus_ids.map! do |bus_id|
    [
      (bus_id..).step(bus_id).lazy.drop_while { |m| m < arrival_ts }.first,
      bus_id
    ]
  end

  next_bus = bus_ids.min

  (next_bus.first - arrival_ts) * next_bus.last
end

def part_two(input)
  times_with_offsets = parse_times_and_offsets(input)

  timestamp = 0
  lcm = times_with_offsets.first.first

  times_with_offsets[1..].each do |time, offset|
    timestamp += lcm while (timestamp + offset) % time != 0

    lcm *= time
  end

  timestamp
end

def parse_times_and_offsets(input)
  bus_ids = input.last.split(',')

  buses = []
  bus_ids.each_with_index do |bus_id, i|
    if bus_id != 'x'
      bus_id = bus_id.to_i
      offset = i
    end
    buses << [ bus_id, offset ]
  end

  buses.filter { |pair| pair.first != 'x' }
end

