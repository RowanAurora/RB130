class Diamond
  LETTERS = ("A".."Z").to_a

  def self.make_diamond(input)
    outside = LETTERS.index(input)
    inside = 1
    result = []
    current_letter = "A"
    result << " " * (outside) + current_letter + " " * (outside)
    result = result_loop(current_letter, outside, inside, result, input)
    (result + result[0..-2].reverse).join("\n") + ("\n")
  end

  class << self
    private

    def make_row(outside, inside, current_letter)
      (" " * outside) + current_letter +
        (" " * inside) + current_letter +
        (" " * outside)
    end

    def result_loop(current_letter, outside, inside, result, input)
      until current_letter == input
        outside -= 1
        current_letter = current_letter.next
        result << make_row(outside, inside, current_letter)
        inside += 2
      end
      result
    end
  end
end
