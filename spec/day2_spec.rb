# frozen_string_literal: true

require "rspec"
require_relative "../lib/day2"

RSpec.describe Day2 do
  describe "with test data of part 1" do
    it "should return 8" do
      input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green".split("\n")
      result = Day2.part_one(input)
      expect(result).to eq(8)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day2.part_one
      expect(result).to eq(2369)
    end
  end

  describe "with test data of part 2" do
    it "should return 2286" do
      input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green".split("\n")
      result = Day2.part_two(input)
      expect(result).to eq(2286)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      pending
      result = Day2.part_two
      expect(result).to eq(54719)
    end
  end
end
