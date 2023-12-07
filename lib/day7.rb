# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day7
  def self.part_one(input = AocInput.read_day(7))
    hand_list = HandList.from_aoc_input(input).sort
    hand_list.map.with_index { |hand, index| hand.bid * (index + 1) }.sum
  end

  def self.part_two(input = AocInput.read_day(7))
    hand_list = HandList.from_aoc_input_for_part_2(input).sort
    hand_list.map.with_index { |hand, index| hand.bid * (index + 1) }.sum
  end
end

module HandList
  def self.from_aoc_input(aoc_input)
    aoc_input.map{|game| game.split(" ")}.map{|(hand, bid)| Hand.new(hand, bid)}
  end

  def self.from_aoc_input_for_part_2(aoc_input)
    aoc_input.map{|game| game.split(" ")}.map{|(hand, bid)| HandWithJokers.new(hand, bid)}
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

  def initialize(cards, bid)
    @cards = cards.split("").map(&:upcase)
    @bid = bid.to_i
    @rank = RANKS[@cards.tally.values.sort.reverse]
  end

  def <=>(other)
    @rank != other.rank ? RANKS_ORDER[@rank] - RANKS_ORDER[other.rank] : @cards.zip(other.cards).map{|card, other_card| order[card] - order[other_card] }.find{ |num| num != 0}
  end

  private

  def order
    {
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
  end
end

class HandWithJokers < Hand
  def initialize(cards, bid)
    if cards.include?("J")
      @cards = cards.split("").map(&:upcase)
      @bid = bid.to_i
      @rank = parse_rank_with_jacks(@cards)
    else
      super(cards, bid)
    end
  end

  private

  def parse_rank_with_jacks(card_array)
    return "super_poker" if card_array.all? { |card| card == "J" }

    cards_tally = @cards.tally
    number_of_jacks = cards_tally["J"] || 0
    values = cards_tally.values
    values.delete_at(values.index(number_of_jacks))
    values = values.sort.reverse
    values[0] += number_of_jacks
    RANKS[values]
  end

  def order
    {
      'J' => 0,
      '2' => 1,
      '3' => 2,
      '4' => 3,
      '5' => 4,
      '6' => 5,
      '7' => 6,
      '8' => 7,
      '9' => 8,
      'T' => 9,
      'Q' => 11,
      'K' => 12,
      'A' => 13
    }
  end
end