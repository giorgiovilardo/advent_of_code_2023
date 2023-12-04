# frozen_string_literal: true

require "rspec"
require_relative "../lib/day3"

RSpec.describe Day3 do
  describe "with test data of part 1" do
    it "should return 4361" do
      input = "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..".split("\n")
      result = Day3.part_one(input)
      expect(result).to eq(4361)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day3.part_one
      expect(result).to eq(546312)
    end
  end

  describe "with test data of part 2" do
    it "should return 2286" do
      pending
      input = "".split("\n")
      result = Day3.part_two(input)
      expect(result).to eq(2286)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      pending
      result = Day3.part_two
      expect(result).to eq(87449461)
    end
  end
end
