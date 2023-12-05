# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day5
  def self.part_one(input = AocInput.read_day(5))
    seed_list = SeedList.new(input.first)
    seedmaps = SeedMap.from_aoc_input(input)
    locations = seed_list.map { |seed_number| seedmaps.inject(seed_number) { |seednum, seedmap| seedmap.transform(seednum)}}
    locations.min
  end

  def self.part_two(input = AocInput.read_day(5))
    1
  end
end

class SeedList
  include Enumerable

  attr_reader :seeds

  def initialize(seed_row)
    @seeds = seed_row.split(" ").drop(1).map(&:to_i)
  end

  def each
    @seeds.each { |item| yield item }
  end
end

class SeedMap
  attr_reader :values, :from, :to

  def initialize(from, to, values)
    @from = from
    @to = to
    @values = values
  end

  def transform(number)
    @values.each do |key_range, value_range|
      if key_range.cover?(number)
        return value_range.begin + (number - key_range.begin)
      end
    end
    number
  end

  def self.from_aoc_input(input)
    input
      .drop(1)
      .reject(&:empty?)
      .slice_before { |row| row.end_with?("map:") }
      .map do |chunk|
        from, to = chunk.first.split(" ").first.split("-").reject { |el| el == "to"}
        triplets = chunk.drop(1).map { |group| group.split.map(&:to_i)}
        SeedMap.new(
          from,
          to,
          triplets.map { |(destination, source, times)| {source..source+times-1 => destination..destination+times-1} }.inject(&:merge)
        )
      end
  end
end
