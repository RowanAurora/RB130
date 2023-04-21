
class Scrabble
  ALPHABET = ('A'..'Z').to_a
  
  SCORE = { 'AEIOULNRST' => 1,
    'DG' =>	2,
    'BCMP' =>	3,
    'FHVWY' =>	4,
    'K' => 5,
    'JX' =>	8,
    'QZ' =>	10 }

  def initialize(word)

    @word = validated(word) 
    @score = 0
  end

  def score 
    @word.each do |letter|
      SCORE.each do |letters, value|
        @score += value if letters.include?(letter) 
      end
    end
    @score
  end

  def validated(word)
    return [' '] if word.nil?
    word != nil || word.upcase.chars.all? { |letter| ALPHABET.include?(letter) } ? word.upcase.chars : ['']
  end

  def self.score(str)
    Scrabble.new(str).score
  end

end

p Scrabble.new('alacrity').score