class RomanNumeral
  ROMAN = { 1 => "I", 5 => "V", 10 => 'X', 50 => "L", 100 => "C",
            500 => "D", 1000 => "M", 5000 => 'V̅' }
  SIZED = { 1 => 1, 2 => 10, 3 => 100, 4 => 1000 }

  def initialize(numbers)
    @numbers = numbers
    @arr = []
  end

  def to_roman
    numbers_to_expanded_form
    base_array = to_base_array
    expanded_base_array = spread_base_array(base_array)
    compensated_array = compensate_for_4_5_9(expanded_base_array)
    to_roman_charaters(compensated_array)
  end

  private

  def numbers_to_expanded_form
    # break number into array ie 612 => [600, 10, 2]
    numeral = @numbers.to_s.chars.reverse
    numeral.each_with_index do |number, idx|
      @arr << number + ("0" * idx)
    end
    @arr.reverse!
  end

  def to_base_array
    # generates an array that has the approriate base ie [100, 10, 1]
    @arr.map do |char|
      SIZED[char.size]
    end
  end

  def spread_base_array(base_array)
    # Makes an array representation for the numbers
    # [[100, 100, 100, 100, 100, 100], [10], [1, 1]]
    arr3 = []
    base_array.each_with_index do |item, idx|
      arr3 << [item] * @arr[idx][0].to_i
    end
    arr3
  end

  def compensate_for_4_5_9(expanded_base_array)
    # formats array to representing how roman numerals are laid out
    # [[100, 100, 100, 100, 100, 100], [10], [1, 1]]
    # => [[500], [100], [10], [1, 1]}
    arr4 = []
    expanded_base_array.each do |item|
      case item.size
      when 9 then arr4 << [item[0], (item[0].to_s + '0').to_i]
      when 4 then arr4 << [item[0], (item << item[0]).reduce(&:+)]
      when 5, 6, 7, 8 then for_5(arr4, item)
      when 1, 2, 3 then arr4 << item
      end
    end
    arr4
  end

  def for_5(arr4, item)
    # helper method to save lines for compensate_for_4_5_9
    arr5 = item[0..4].reduce(&:+)
    arr4 << [arr5]
    arr4 << item[5..-1]
  end

  def to_roman_charaters(compensated_array)
    # Uses the array to convert to roman numerals
    compensated_array.map do |item|
      item.map { |part| ROMAN[part] }
    end.join
  end
end

