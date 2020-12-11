# frozen_string_literal: true

def part_one(input)
  graph = Graph.new

  input.each { |line| graph.parse(line) }

  graph.find_ancestors('shiny gold')
end

class Graph
  attr_accessor :vertices, :visited

  def initialize
    @vertices = []
    @visited = []
  end

  def parse(line)
    parent_color, children = line.split(' bags contain ')
    children = children.split(', ')

    add_bag(parent_color)

    children.each do |child|
      child.match(/\d+ (\w+ \w+)/) do |m|
        child_color = m[1]
        add_bag(child_color)
        add_child(parent_color, child_color)
      end
    end
  end

  def add_bag(color)
    vertices << Vertex.new(color) if find_vertex_by_color(color).nil?
  end

  def add_child(parent_color, child_color)
    parent_index = vertices.index { |v| v.color == parent_color }
    child_index = vertices.index { |v| v.color == child_color }

    vertices[parent_index].children[child_index] = true
    vertices[child_index].parents[parent_index] = true
  end

  def find_vertex_by_color(color)
    vertices.each do |v|
      return v if v.color == color
    end

    nil
  end

  def find_ancestors(color)
    current_vertex = find_vertex_by_color(color)
    ancestors = 0

    current_vertex.parents.each_with_index do |is_parent, i|
      parent = vertices[i]
      next if !is_parent || visited.include?(parent)

      visited << parent
      ancestors += 1
      ancestors += find_ancestors(parent.color)
    end

    ancestors
  end
end

class Vertex
  attr_accessor :color, :children, :parents

  def initialize(color)
    @color = color
    @parents = []
    @children = []
  end
end

