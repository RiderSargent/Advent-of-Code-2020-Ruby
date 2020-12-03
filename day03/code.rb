# frozen_string_literal: true

def part_one(input)
  trees_on_path(1, 3, input)
end

def part_two(input)
  [
    trees_on_path(1, 1, input),
    trees_on_path(1, 3, input),
    trees_on_path(1, 5, input),
    trees_on_path(1, 7, input),
    trees_on_path(2, 1, input)
  ].reduce(&:*)
end

def trees_on_path(rise, run, input)
  input = input.map(&:chars)

  row_length = input.first.length
  col_length = input.length

  row = 0
  col = 0

  trees = 0

  while row < col_length
    trees += 1 if input[row][col] == '#'
    row += rise
    col = (col + run) % row_length
  end

  trees
end

