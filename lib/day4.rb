# frozen_string_literal: true

require_relative 'helper/aoc_input'

module Day4
  def self.part_one(input=AocInput.read_day(4))
    card_list = input.map { |game_row| Card.new(game_row) }
    card_list.map(&:value).sum
  end

  def self.part_two(input=AocInput.read_day(4))
    1
  end
end

class Card
  def initialize(game_row)
    match = /Card\W+(?<card_id>\d+):\W+(?<winning_numbers>.*)\W+\|\W+(?<my_numbers>.*)/.match(game_row)
    @id = match[:card_id]
    @winning_numbers = match[:winning_numbers].to_s.split(" ").map(&:strip)
    @my_numbers = match[:my_numbers].to_s.split(" ").map(&:strip)
  end

  def value
    winning_my_numbers_count = (@my_numbers & @winning_numbers).size
    winning_my_numbers_count == 0 ? 0 : 2**(winning_my_numbers_count - 1)
  end
end