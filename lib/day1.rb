# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day1
  def self.part_one(input = AocInput.read_day(1))
    input.map { |line| line.delete("^0-9") }
         .map { |number_string| (number_string[0] + number_string[-1]).to_i }
         .sum
  end
end
