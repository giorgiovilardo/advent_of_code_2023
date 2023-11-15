# frozen_string_literal: true

require "rspec"
require_relative "../../lib/sandbox/my_math"

RSpec.describe MyMath do
  describe ".square_and_sum" do
    it "squares each number and returns the sum" do
      result = MyMath.square_and_sum([1, 2, 3, 4])
      expect(result).to eq(30)
    end

    it "returns 0 for an empty array" do
      result = MyMath.square_and_sum([])
      expect(result).to eq(0)
    end
  end
end
