# frozen_string_literal: true

require "rspec"
require_relative "../../lib/helper/aoc_input"

RSpec.describe AocInput do
  describe ".read_day" do
    it "reads a specific day and returns a list of lines" do
      test_file_path = File.expand_path("../fixtures/day_1.txt", __dir__)
      expect(AocInput.read_day(1, test_file_path)).to eq %w[1 2 3 4 5 6 7]
      test_file_path = File.expand_path("../fixtures/day_2.txt", __dir__)
      expect(AocInput.read_day(1, test_file_path)).to eq %w[1 2]
    end
  end
end
