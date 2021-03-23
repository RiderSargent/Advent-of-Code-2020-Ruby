# frozen_string_literal: true

require "set"

def part_one(input)
  groups(input).reduce(0) do |group_memo, group|
    group_memo + group.reduce do |person_memo, person|
      person_memo.union person
    end.count
  end
end

def part_two(input)
  groups(input).reduce(0) do |group_memo, group|
    group_memo + group.reduce do |person_memo, person|
      person_memo.intersection person
    end.count
  end
end

def groups(input)
  input << ""
  group = []
  groups = []

  input.each do |line|
    if line.empty?
      groups << group
      group = []
    else
      group << line.chars.to_set
    end
  end

  groups
end
