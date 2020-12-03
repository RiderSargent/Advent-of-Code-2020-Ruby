def part_1(input)
  row_length = input.first.length
  col_length = input.length

  input = input.map(&:chars)

  row = 0
  col = 0

  trees = 0

  while row < col_length do
    trees += 1 if input[row][col] == '#'
    row += 1
    col = (col + 3) % row_length
  end

  trees
end

