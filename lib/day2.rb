# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day2
  MAX_CUBES = {
    red: 12,
    green: 13,
    blue: 14,
  }

  def self.part_one(input = AocInput.read_day(2))
    parsed_games = input.map { |line| parse_gameline(line) }
      .map do |results|
      { id: results[:id] }.merge(
        results[:games].reduce do |memo, hash|
          hash.merge(memo) { |_, oldval, newval| [oldval, newval].max }
        end
      )
    end

    parsed_games.select do |item|
      [:red, :green, :blue].all? { |color| item[color] <= MAX_CUBES[color] }
    end.map { |item| item[:id] }.sum
  end

  def self.part_two(input = AocInput.read_day(2))
    1
  end

  # @param line [String]
  def self.parse_gameline(line)
    # just one comma guaranteed, safe to split and destructure
    game_id, game_results = line.split(":")

    game_id = game_id[/\d+/].to_i
    results = game_results.split(";").map do
      |game_result|
      parse_result(game_result.strip.split(","))
    end

    {
      id: game_id,
      games: results,
    }
  end

  # @param results [Array<String>]
  # @return [Hash{Symbol->Integer}]
  def self.parse_result(results)
    color_values = results.map { |result|
      id, color = result.split
      [color.to_sym, id.to_i]
    }.to_h
    { red: 0, green: 0, blue: 0 }.merge(color_values)
  end
end
