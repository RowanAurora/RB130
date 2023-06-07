require 'bundler/setup'

class Anagram
  attr_reader :detector

  def initialize(detector)
    @detector = detector.downcase
  end

  def match(array)
    reference = detector.chars.sort
    array.select do |word|
      word.downcase.chars.sort == reference && word.downcase != detector
    end.uniq
  end
end
