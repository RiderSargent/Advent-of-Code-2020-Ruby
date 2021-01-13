# frozen_string_literal: true

def part_one(input)
  initial_plane = input.map { |l| l.split('') }

  active_cubes = {}
  initial_plane.each_with_index do |row, r|
    row.each_with_index do |char, c|
      next if char != '#'

      active_cubes[[ r, c, 10 ]] = true
    end
  end

  6.times do
    active_cubes = tick(active_cubes)
  end

  active_cubes.length
end

def get_neighbor_coords(current_coords)
  x, y, z = current_coords

  [
    [ -1, -1, -1 ],
    [ -1, -1,  1 ],
    [ -1, -1,  0 ],
    [ -1,  1, -1 ],
    [ -1,  1,  1 ],
    [ -1,  1,  0 ],
    [ -1,  0, -1 ],
    [ -1,  0,  1 ],
    [ -1,  0,  0 ],
    [  1, -1, -1 ],
    [  1, -1,  1 ],
    [  1, -1,  0 ],
    [  1,  1, -1 ],
    [  1,  1,  1 ],
    [  1,  1,  0 ],
    [  1,  0, -1 ],
    [  1,  0,  1 ],
    [  1,  0,  0 ],
    [  0, -1, -1 ],
    [  0, -1,  1 ],
    [  0, -1,  0 ],
    [  0,  1, -1 ],
    [  0,  1,  1 ],
    [  0,  1,  0 ],
    [  0,  0, -1 ],
    [  0,  0,  1 ]
  ].map do |dx, dy, dz|
    [ x + dx, y + dy, z + dz ]
  end
end

def count_active_neighbors(active_cubes, neighbors_coords)
  neighbors_coords.count do |neighbor_coords|
    active_cubes[neighbor_coords]
  end
end

def tick(active_cubes)
  next_active_cubes = {}
  inactives_to_check = {}

  # If a cube is active and exactly 2 or 3 of its neighbors are also active,
  # the cube remains active. Otherwise, the cube becomes inactive.
  active_cubes.each_key do |current_coords|
    neighbors_coords = get_neighbor_coords(current_coords)
    if [ 2, 3 ].include?(count_active_neighbors(active_cubes, neighbors_coords))
      next_active_cubes[current_coords] = true
    end

    neighbors_coords.each do |neighbor_coords|
      inactives_to_check[neighbor_coords] = true
    end
  end

  # If a cube is inactive but exactly 3 of its neighbors are active, the cube
  # becomes active. Otherwise, the cube remains inactive.
  inactives_to_check.each_key do |current_coords|
    neighbors_coords = get_neighbor_coords(current_coords)
    if count_active_neighbors(active_cubes, neighbors_coords) == 3
      next_active_cubes[current_coords] = true
    end
  end

  next_active_cubes
end

