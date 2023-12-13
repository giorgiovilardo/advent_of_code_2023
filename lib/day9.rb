# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day9
  def self.part_one(input = AocInput.read_day(9))
    reports = input.map{|line| line.split(" ").map(&:to_i)}.map{|i| Report.new(i)}
    reports.map(&:solve).sum
  end

  def self.part_two(input = AocInput.read_day(9))
    reports = input.map{|line| line.split(" ").map(&:to_i)}.map{|i| Report.new(i)}
    reports.map(&:solve_2).sum
  end
end

class Report
  attr_reader :data

  def initialize(data)
    @initial_data = data
    @data = parse(@initial_data)
  end

  def solve(data=@data)
    data.map(&:last).sum
  end

  def solve_2(data=@data)
    data
      .map(&:first)
      .map.with_index { |num, i| i.odd? ? -num : num }
      .sum
  end

  def parse(data)
    acc = []
    windows = data.each_cons(2).map{ |first, sec| sec-first }
    acc.push(data)
    until windows.all?(&:zero?)
      acc.push(windows)
      windows = windows.each_cons(2).map{ |first, sec| sec-first }
    end
    acc.push(windows)
  end
end
