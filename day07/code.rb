# frozen_string_literal: true

def part_one(input)
  graph = Graph.new

  input.each { |line| graph.parse(line) }

  graph.find_ancestors('shiny gold')
end

def part_two(input)
  graph = Graph.new

  input.each { |line| graph.parse(line) }

  graph.find_descendants('shiny gold')
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

    add_vertex(parent_color)

    children.each do |child|
      child.match(/(\d+) (\w+ \w+)/) do |m|
        num_bags = m[1]
        child_color = m[2]
        add_vertex(child_color)
        add_edge(parent_color, child_color, num_bags)
      end
    end
  end

  def add_vertex(color)
    vertices << Vertex.new(color) if find_vertex_by_color(color).nil?
  end

  def add_edge(parent_color, child_color, weight)
    parent_index = vertices.index { |v| v.color == parent_color }
    child_index = vertices.index { |v| v.color == child_color }

    vertices[parent_index].children[child_index] = true
    vertices[parent_index].weights[child_index] = weight
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

  def find_descendants(color)
    current_vertex = find_vertex_by_color(color)
    current_children = current_vertex.children

    descendants = 0

    current_children.each_with_index do |is_child, i|
      next unless is_child

      child = vertices[i]

      descendants += current_vertex.weights[i].to_i
      descendants += current_vertex.weights[i].to_i * find_descendants(child.color)
    end

    descendants
  end
end

class Vertex
  attr_reader :color, :children, :parents, :weights

  def initialize(color)
    @color = color
    @parents = []
    @children = []
    @weights = []
  end
end

