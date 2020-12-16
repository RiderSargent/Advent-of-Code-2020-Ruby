# frozen_string_literal: true

def part_one(input)
  Ferry.new.follow_path(input).manhattan_distance_from_origin
end

class Ferry
  attr_accessor :row, :col, :dir

  def initialize
    @row = 0
    @col = 0
    @dir = 90
  end

  def follow_path(input)
    directions = parse(input)

    directions.each do |direction|
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

