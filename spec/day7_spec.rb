# frozen_string_literal: true

require "rspec"
require_relative "../lib/day7"

RSpec.describe Day7 do
  describe "with test data of part 1" do
    it "should return 6440" do
      input = "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483".split("\n")
      result = Day7.part_one(input)
      expect(result).to eq(6440)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day7.part_one
      expect(result).to eq(250946742)
    end
  end

  describe "with test data of part 2" do
    it "should return 5905" do
      input = "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483".split("\n")
      result = Day7.part_two(input)
      expect(result).to eq(5905)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      result = Day7.part_two
      expect(result).to eq(251824095)
    end
  end
end
