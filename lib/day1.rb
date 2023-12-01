# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day1
  MAPPINGS = {
    "one" => "o1e",
    "two" => "t2o",
    "three" => "t3e",
    "four" => "f4r",
    "five" => "f5e",
    "six" => "s6x",
    "seven" => "s7n",
    "eight" => "e8t",
    "nine" => "n9e",
  }.freeze

  def self.part_one(input = AocInput.read_day(1))
    input.map { |line| line.delete("^0-9") }
         .map { |number_string| (number_string[0] + number_string[-1]).to_i }
         .sum
  end

  def self.part_two(input = AocInput.read_day(1))
    part_one(
      input.map do |line|
        MAPPINGS.inject(line) { |temp_str, (key, value)| temp_str.gsub(key, value) }
      end
    )
  end
end
