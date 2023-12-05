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
    seed_list = RangedSeedList.new(input.first)
    seedmaps = SeedMap.from_aoc_input(input).reverse
    # helper = ->(n, s) {"From #{seedmaps[s].to} #{n} to #{seedmaps[s].from} #{seedmaps[s].reverse_transform(n)}"}
    result = (0..Float::INFINITY).lazy.map {
      |number_to_test|
      seedmaps.inject(number_to_test){
        |seednum, seedmap|
        seedmap.reverse_transform(seednum)
      }
    }.find { |seed_number| seed_list.contains?(seed_number)}

    seedmaps.reverse.inject(result) { |seednum, seedmap| seedmap.transform(seednum)}
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

class RangedSeedList < SeedList
  def initialize(seed_row)
    @seeds = seed_row.split(" ").drop(1).map(&:to_i).each_slice(2).map{|(start, times)| start..start+times}
  end

  def contains?(seed_number)
    @seeds.any? { |range| range.cover?(seed_number) }
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

  def reverse_transform(number)
    @values.each do |key_range, value_range|
      if value_range.cover?(number)
        return key_range.begin + (number - value_range.begin)
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
        triplets = chunk.drop(1).map { |group| group.split.map(&:to_i) }
        SeedMap.new(
          from,
          to,
          triplets.map { |(destination, source, times)| {source..source+times-1 => destination..destination+times-1} }.inject(&:merge)
        )
      end
  end
end
