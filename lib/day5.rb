# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day5
  def self.part_one(input = AocInput.read_day(5))
    1
  end

  def self.part_two(input = AocInput.read_day(5))
    1
  end
end

class SeedList
  attr_reader :seeds

  def initialize(seed_row)
    @seeds = seed_row.split(" ").drop(1).map(&:to_i)
  end
end

class SeedMap
  attr_reader :type, :values

  def initialize(type, values)
    @type = type
    @values = values
  end

  def self.from_aoc_input(input)
    input
      .drop(1)
      .reject(&:empty?)
      .slice_before { |row| row.end_with?("map:") }
      .map { |chunk| SeedMap.new(chunk.first.split(" ").first, chunk.drop(1).join(" ").split.map(&:to_i)) }
  end
end
