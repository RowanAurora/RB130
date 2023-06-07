class Scrabble
  attr_reader :word

  SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  def initialize(word)
    @word = word ? word.upcase.chars : []
  end

  def score
    result = 0
    SCORES.each do |score, array|
      word.each { |letter| result += score if array.include?(letter) }
    end
    result
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
