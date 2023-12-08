# frozen_string_literal: true

require "rspec"
require_relative "../lib/day8"

RSpec.describe Day8 do
  describe "with test data of part 1" do
    it "the first example should return 2" do
      input = "RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)".split("\n")
      result = Day8.part_one(input)
      expect(result).to eq(2)
    end

    it "the second example should return 6" do
      input = "LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)".split("\n")
      result = Day8.part_one(input)
      expect(result).to eq(6)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      result = Day8.part_one
      expect(result).to eq(17287)
    end
  end

  describe "with test data of part 2" do
    it "the first example should return 6" do
      input = "LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)".split("\n")
      result = Day8.part_two(input)
      expect(result).to eq(6)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      result = Day8.part_two
      expect(result).to eq(18625484023687)
    end
  end
end
