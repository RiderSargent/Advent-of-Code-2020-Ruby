# frozen_string_literal: true

def part_one(input)
  last_round = [""]
  this_round = input

  while last_round != this_round
    last_round = this_round
    this_round = next_round(last_round)
  end

  count_seated(this_round)
end

def part_two(input)
  last_round = [""]
  this_round = input

  while last_round != this_round
    last_round = this_round
    this_round = next_round_part_two(last_round)
  end

  count_seated(this_round)
end

def count_seated(seats)
  seats.map { |row| row.count("#") }.sum
end

def next_round(seats)
  # If a seat is empty (L) and there are no occupied seats adjacent to it,
  #   the seat becomes occupied.
  # If a seat is occupied (#) and four or more seats adjacent to it are also occupied,
  #   the seat becomes empty.
  # Otherwise, the seat's state does not change.

  seats = seats.map(&:chars)
  num_rows = seats.length
  num_cols = seats.first.length

  nexts = seats.clone.map(&:clone)

  0.upto(num_rows - 1) do |r|
    0.upto(num_cols - 1) do |c|
      next if seats[r][c] == "."

      is_empty = seats[r][c] == "L"
      surrounded_by = seated_around(r, c, seats)

      if is_empty && surrounded_by.zero?
        nexts[r][c] = "#"
      elsif !is_empty && surrounded_by > 3
        nexts[r][c] = "L"
      end
    end
  end

  nexts.map(&:join)
end

def seated_around(r, c, seats)
  result = 0

  result += 1 if in_bounds?(r - 1, c - 1, seats) && seats[r - 1][c - 1] == "#"
  result += 1 if in_bounds?(r - 1, c, seats) && seats[r - 1][c] == "#"
  result += 1 if in_bounds?(r - 1, c + 1, seats) && seats[r - 1][c + 1] == "#"
  result += 1 if in_bounds?(r, c - 1, seats) && seats[r][c - 1] == "#"
  result += 1 if in_bounds?(r, c + 1, seats) && seats[r][c + 1] == "#"
  result += 1 if in_bounds?(r + 1, c - 1, seats) && seats[r + 1][c - 1] == "#"
  result += 1 if in_bounds?(r + 1, c, seats) && seats[r + 1][c] == "#"
  result += 1 if in_bounds?(r + 1, c + 1, seats) && seats[r + 1][c + 1] == "#"

  result
end

def next_round_part_two(seats)
  # If a seat is empty (L) and there are no occupied seats adjacent to it,
  #   the seat becomes occupied.
  # If a seat is occupied (#) and five or more seats visible to it are also occupied,
  #   the seat becomes empty.
  # Otherwise, the seat's state does not change.

  seats = seats.map(&:chars)
  num_rows = seats.length
  num_cols = seats.first.length

  nexts = seats.clone.map(&:clone)

  0.upto(num_rows - 1) do |r|
    0.upto(num_cols - 1) do |c|
      next if seats[r][c] == "."

      is_empty = seats[r][c] == "L"
      visibly_taken = visible_from(r, c, seats)

      if is_empty && visibly_taken.zero?
        nexts[r][c] = "#"
      elsif !is_empty && visibly_taken > 4
        nexts[r][c] = "L"
      end
    end
  end

  nexts.map(&:join)
end

def visible_from(r, c, seats)
  [
    search("up", r, c, seats),
    search("up_and_right", r, c, seats),
    search("right", r, c, seats),
    search("down_and_right", r, c, seats),
    search("down", r, c, seats),
    search("down_and_left", r, c, seats),
    search("left", r, c, seats),
    search("up_and_left", r, c, seats)
  ].sum
end

def search(dir, r, c, seats)
  loop do
    case dir
    when "up"
      r -= 1
    when "down"
      r += 1
    when "left"
      c -= 1
    when "right"
      c += 1
    when "up_and_right"
      r -= 1
      c += 1
    when "down_and_right"
      r += 1
      c += 1
    when "down_and_left"
      r += 1
      c -= 1
    when "up_and_left"
      r -= 1
      c -= 1
    end

    return 0 if !in_bounds?(r, c, seats) || seats[r][c] == "L"
    return 1 if seats[r][c] == "#"
  end
  0
end

def search_up_and_left(r, c, seats)
  while in_bounds?(r - 1, c - 1, seats)
    r -= 1
    c -= 1

    return 1 if seats[r][c] == "#"
    return 0 if seats[r][c] == "L"
  end
  0
end

def in_bounds?(r, c, seats)
  num_rows = seats.length
  num_cols = seats.first.length

  [
    r >= 0,
    r < num_rows,
    c >= 0,
    c < num_cols
  ].all?
end
