# frozen_string_literal: true

require_relative "helper/aoc_input"

module Day6
  def self.part_one(input = AocInput.read_day(6))
    duration, record = input.map{_1.split(":").last.split(" ").map(&:to_i)}
    race_list = duration.zip(record).map{|(duration, record)| Race.new(duration, record)}
    race_list.map(&:ways_to_beat_record_count).inject(:*)
  end

  def self.part_two(input = AocInput.read_day(6))
    duration, record = input.map{_1.split(":").last.delete(" ")}.map(&:to_i)
    race = Race.new(duration, record)
    race.ways_to_beat_record_count
  end
end


class Race
  attr_reader :duration, :record

  def initialize(duration, record)
    @duration = duration
    @record = record
  end

  def ways_to_beat_record_count
    (0..@duration).count { |time_of_acceleration| (@duration - time_of_acceleration) * time_of_acceleration > @record}
  end
end