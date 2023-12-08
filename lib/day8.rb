# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day8
  def self.part_one(input = AocInput.read_day(8))
    move_list = MoveList.from_aoc_input(input)
    node_map = NodeMap.from_aoc_input(input)
    until node_map.at_end?
      node_map = node_map.public_send(move_list.next_move)
    end
    move_list.steps
  end

  def self.part_two(input = AocInput.read_day(8))
    1
  end
end

class MoveList
  attr_reader :move_list, :steps

  def initialize(move_list, steps = 0)
    @move_list = move_list
    @steps = steps
  end

  def next_move
    move = @move_list[@steps % @move_list.size]
    @steps += 1
    move == "L" ? :move_left : :move_right
  end

  def self.from_aoc_input(input)
    self.new(input.take(1).first.split(""))
  end
end

class NodeMap
  def initialize(node_map, position="AAA")
    @node_map = node_map
    @position = position
  end

  def self.from_aoc_input(input)
    self.new(
      input.drop(2).map do |line|
        match = line.match(/(?<name>\w{3}) = \((?<left>\w{3}), (?<right>\w{3})\)/)
        {match[:name] => [match[:left], match[:right]]}
      end.inject(&:merge),
    )
  end

  def move_left
    NodeMap.new(@node_map, @node_map[@position].first)
  end

  def move_right
    NodeMap.new(@node_map, @node_map[@position].last)
  end

  def at_end?
    @position == "ZZZ"
  end
end
