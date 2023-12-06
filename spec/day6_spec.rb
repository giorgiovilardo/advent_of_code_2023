# frozen_string_literal: true

require "rspec"
require_relative "../lib/day6"

RSpec.describe Day6 do
  describe "with test data of part 1" do
    it "should return 288" do
      input = "Time:      7  15   30
Distance:  9  40  200".split("\n")
      result = Day6.part_one(input)
      expect(result).to eq(288)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day6.part_one
      expect(result).to eq(633080)
    end
  end

  describe "with test data of part 2" do
    it "should return 71503" do
      input = "Time:      7  15   30
Distance:  9  40  200".split("\n")
      result = Day6.part_two(input)
      expect(result).to eq(71503)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      result = Day6.part_two
      expect(result).to eq(20048741)
    end
  end
end
