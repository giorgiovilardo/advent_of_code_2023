# frozen_string_literal: true

require "rspec"
require_relative "../lib/day1"

RSpec.describe Day1 do
  describe "with test data of part 1" do
    it "should return 142" do
      input = "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet".split("\n")
      result = Day1.part_one(input)
      expect(result).to eq(142)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day1.part_one
      expect(result).to eq(55971)
    end
  end

  describe "with test data of part 2" do
    it "should return 281" do
      input = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen".split("\n")
      result = Day1.part_two(input)
      expect(result).to eq(281)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      result = Day1.part_two
      expect(result).to eq(54719)
    end
  end
end
