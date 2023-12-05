# frozen_string_literal: true

require "rspec"
require_relative "../lib/day5"

RSpec.describe Day5 do
  describe "with test data of part 1" do
    it "should return 13" do
      input = "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4".split("\n")
      result = Day5.part_one(input)
      expect(result).to eq(35)
    end
  end

  describe "with real data of part 1" do
    it "should return the correct value" do
      pending
      result = Day5.part_one
      expect(result).to eq(23235)
    end
  end

  describe "with test data of part 2" do
    it "should return 30" do
      pending
      input = "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4".split("\n")
      result = Day5.part_two(input)
      expect(result).to eq(30)
    end
  end

  describe "with real data of part 2" do
    it "should return the correct value" do
      pending
      result = Day5.part_two
      expect(result).to eq(5920640)
    end
  end
end
