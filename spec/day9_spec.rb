# frozen_string_literal: true

require "rspec"
require_relative "../lib/day9"

RSpec.describe Day9 do
  describe "with test data of part 1" do
    it "should return foo" do
      input = "".split("\n")
      result = Day9.part_one(input)
      expect(result).to eq(1)
    end

    describe "with real data of part 1" do
      it "should return the correct value" do
        result = Day9.part_one
        expect(result).to eq(1)
      end
    end

    describe "with test data of part 2" do
      it "should return foo" do
        input = "".split("\n")
        result = Day9.part_two(input)
        expect(result).to eq(1)
      end
    end

    describe "with real data of part 2" do
      it "should return the correct value" do
        result = Day9.part_two
        expect(result).to eq(1)
      end
    end
  end
end
