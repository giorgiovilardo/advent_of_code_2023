# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day7
  def self.part_one(input = AocInput.read_day(7))
    hand_list = HandList.from_aoc_input(input).sort
    hand_list.map.with_index { |hand, index| hand.bid * (index + 1) }.sum
  end

  def self.part_two(input = AocInput.read_day(7))
    1
  end
end

module HandList
  def self.from_aoc_input(aoc_input)
    aoc_input.map{|game| game.split(" ")}.map{|(hand, bid)| Hand.new(hand, bid)}
  end
end

class Hand
  include Comparable
  attr_reader :cards, :bid, :rank

  RANKS = {
    [5] => "super_poker",
    [4, 1] => "poker",
    [3, 2] => "full",
    [3, 1, 1] => "three_of_a_kind",
    [2, 2, 1] => "two_pairs",
    [2, 1, 1, 1] => "pair",
    [1, 1, 1, 1, 1] => "high_card"
  }

  RANKS_ORDER = {
    "super_poker" => 31,
    "poker" => 27,
    "full" => 22,
    "three_of_a_kind" => 18,
    "two_pairs" => 13,
    "pair" => 9,
    "high_card" => 5}

  ORDER = {
    '2' => 1,
    '3' => 2,
    '4' => 3,
    '5' => 4,
    '6' => 5,
    '7' => 6,
    '8' => 7,
    '9' => 8,
    'T' => 9,
    'J' => 10,
    'Q' => 11,
    'K' => 12,
    'A' => 13
  }

  def initialize(cards, bid)
    @cards = cards.split("").map(&:upcase)
    @bid = bid.to_i
    @rank = RANKS[@cards.tally.values.sort.reverse]
  end

  def <=>(other)
    @rank != other.rank ? RANKS_ORDER[@rank] - RANKS_ORDER[other.rank] : @cards.zip(other.cards).map{|card, other_card| ORDER[card] - ORDER[other_card] }.find{ |num| num != 0}
  end
end
