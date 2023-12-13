# frozen_string_literal: true

require "rspec"
require_relative "../lib/day9"

RSpec.describe Day9 do
  describe "with test data of part 1" do
    it "should return 114" do
      input = "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45".split("\n")
      result = Day9.part_one(input)
      expect(result).to eq(114)
    end

    describe "with real data of part 1" do
      it "should return the correct value" do
        result = Day9.part_one
        expect(result).to eq(1882395907)
      end
    end

    describe "with test data of part 2" do
      it "should return 2" do
        input = "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45".split("\n")
        result = Day9.part_two(input)
        expect(result).to eq(2)
      end
    end

    describe "with real data of part 2" do
      it "should return the correct value" do
        result = Day9.part_two
        expect(result).to eq(1005)
      end
    end
  end
end
