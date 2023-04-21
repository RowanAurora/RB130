class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_list)
    comparator = format_word(word)
    word_list.select { |other_word| anagram?(other_word, comparator) }
  end

  private

  def anagram?(other_word, comparator)
    format_word(other_word) == comparator && word != other_word.downcase
  end

  def format_word(str)
    str.downcase.chars.sort
  end
end
