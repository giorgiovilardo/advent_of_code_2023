# frozen_string_literal: true

require "rspec"
require_relative "../lib/day4"

RSpec.describe Day4 do
  describe "with test data of part 1" do
    it "should return 13" do
      input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11".split("\n")
      result = Day4.part_one(input)
      expect(result).to eq(13)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day4.part_one
      expect(result).to eq(23235)
    end
  end

  describe "with test data of part 2" do
    it "should return 30" do
      input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11".split("\n")
      result = Day4.part_two(input)
      expect(result).to eq(30)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      result = Day4.part_two
      expect(result).to eq(5920640)
    end
  end
end
