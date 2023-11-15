# frozen_string_literal: true

class AocInput
  # @param num [Integer]
  # @return [Array<String>]
  def self.read_day(num, file_path = nil)
    file_path ||= File.expand_path("../../resources/day_#{num}.txt", __dir__)

    File.open(file_path).readlines.map!(&:rstrip)
  end
end
