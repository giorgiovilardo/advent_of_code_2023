# frozen_string_literal: true

require_relative 'helper/aoc_input'

module Day3
  def self.part_one(input=AocInput.read_day(3))
    engine = Engine.new(input)
    engine.valid_numbers.map {|num| num.value}.sum
    end

  def self.part_two(input=AocInput.read_day(3))
    1
  end
end

class Engine
  attr_reader :schema_rows, :symbols, :x, :y, :numbers

  # @param data [Array<String>]
  def initialize(data)
    @x = data.length
    @y = @x == 0 ? 0 : data[0].length
    @schema_rows = data.map{ _1.chars }
    @symbols = @schema_rows.flat_map.with_index do |row, row_number|
      row.map.with_index do |cell, cell_number|
        [cell, [row_number, cell_number]]
      end.select { |(cell, _)| cell.is_engine_symbol? }.map { |_, coords| coords }
    end
    @numbers = @schema_rows.flat_map.with_index { |row, row_index| Number.from_row(row, row_index, @x, @y) }
  end

  def valid_numbers
    symsets = @symbols.map(&:to_set)
    @numbers.select { |num| num.perimeter.any? do |coords|
      symsets.include?(coords.to_set)
    end }
  end
end

class Number
  attr_reader :value, :row_index, :from, :to

  def initialize(value, row_index, max_width, max_height, from, to)
    @value = value
    @row_index = row_index
    @max_width = max_width
    @max_height = max_height
    @from = from
    @to = to
  end

  def self.from_row(row, row_index, max_width, max_height)
    num_coords = row_numbers_data(row)
    num_values = num_coords.map { |coord| coord.map { |cell| row[cell] }}.map { _1.join.to_i }
    num_values.map.with_index { |num, index| Number.new(num, row_index, max_width, max_height, num_coords[index].first, num_coords[index].last) }
  end

  # @return [Array<[Integer, Integer]>]
  def perimeter
    my_coords = (@from..@to).map { |col| [@row_index, col] }
    all_perimeter = (@from..@to).flat_map do |cell|
      left = [cell - 1, 0].max
      right = [cell + 1, @max_width].min
      up = [@row_index - 1, 0].max
      down = [@row_index + 1, @max_height].min
      verticals = [up, @row_index, down]
      horizontals = [left, cell, right]
      verticals.product(horizontals)
    end

    (all_perimeter - my_coords).uniq.sort
  end

  private

  def self.row_numbers_data(row)
    coords = []
    last_seen_coords = []
    row.each_with_index { |cell, index|
      if cell.is_digit?
        last_seen_coords.push(index)
      else
        unless last_seen_coords.empty?
          coords.push(last_seen_coords.dup)
        end
        last_seen_coords.clear
      end
    }
    coords.push(last_seen_coords.dup) unless last_seen_coords.empty?
    coords
  end
end

class String
  def is_digit?
    !!match(/\A\d+\Z/)
  end

  def is_engine_symbol?
    !self.is_digit? && self != "."
  end
end