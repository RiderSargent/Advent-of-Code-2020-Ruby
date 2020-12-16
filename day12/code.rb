# frozen_string_literal: true

def part_one(input)
  Ferry.new(input).follow_path.manhattan_distance_from_origin
end

def part_two(input)
  Ferry.new(input).follow_waypoint.manhattan_distance_from_origin
end

class Ferry
  attr_accessor :row, :col, :dir, :waypoint_row, :waypoint_col

  def initialize(input)
    @row = 0
    @col = 0
    @dir = 90
    @waypoint_row = 1
    @waypoint_col = 10
    @moves = parse(input)
  end

  def follow_path
    @moves.each do |direction|
      action, value = direction

      case action
      when 'N'
        @row += value
      when 'E'
        @col += value
      when 'S'
        @row -= value
      when 'W'
        @col -= value
      when 'L'
        @dir = ((dir + 360) - value) % 360
      when 'R'
        @dir = ((dir + 360) + value) % 360
      when 'F'
        case dir
        when 0
          @row += value
        when 90
          @col += value
        when 180
          @row -= value
        when 270
          @col -= value
        end
      end
    end

    self
  end

  def follow_waypoint
    @moves.each do |direction|
      action, value = direction

      case action
      when 'N'
        @waypoint_row += value
      when 'E'
        @waypoint_col += value
      when 'S'
        @waypoint_row -= value
      when 'W'
        @waypoint_col -= value
      when 'L'
        (value / 90).times do
          row_diff = waypoint_row - row
          col_diff = waypoint_col - col

          @waypoint_row = row + col_diff
          @waypoint_col = col - row_diff
        end
      when 'R'
        (value / 90).times do
          row_diff = waypoint_row - row
          col_diff = waypoint_col - col

          @waypoint_row = row - col_diff
          @waypoint_col = col + row_diff
        end
      when 'F'
        value.times do
          row_diff = waypoint_row - row
          col_diff = waypoint_col - col

          @row = @waypoint_row
          @col = @waypoint_col

          @waypoint_row += row_diff
          @waypoint_col += col_diff
        end
      end
    end

    self
  end

  def manhattan_distance_from_origin
    row.abs + col.abs
  end

  def parse(input)
    input.map do |line|
      action = line[0]
      value = line[1..].to_i
      [ action, value ]
    end
  end
end

