# frozen_string_literal: true

class MyMath
  # Squares each number in the array and returns the sum.
  #
  # @param numbers [Array<Integer>] The array of integers to square.
  # @return [Integer] The sum of squared numbers.
  def self.square_and_sum(numbers)
    numbers.map { |num| num ** 2 }.sum
  end
end
