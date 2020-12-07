# frozen_string_literal: true

def split(seat)
  row = seat.chars.first(7)
  col = seat.chars.last(3)

  [ row, col ]
end

def parse_row(dirs, initial_group)
  rem = initial_group

  dirs.each do |dir|
    half = rem.length / 2
    rem = %w[F L].include?(dir) ? rem.first(half) : rem.last(half)
  end

  rem.first
end

def seat_id(seat)
  row_dirs, col_dirs = split(seat)

  r = parse_row(row_dirs, (0..127).to_a)
  c = parse_row(col_dirs, (0..7).to_a)

  r * 8 + c
end

def part_one(seats)
  seats.map { |seat| seat_id(seat) }.max
end

