class Anagram
attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(word_list)
    result_array = []
    comparator = word.chars.sort
  end

end

Anagram.new("beans")
